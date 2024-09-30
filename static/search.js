(function() {
    'use strict';

    const HIT_LIMIT = 100;
    const REFRESH_LIMIT = 100;
    const CACHE_VERSION = 1;

    function escapeRegExp(string) {
        return string.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
    }

    function wait(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    async function getSearchIndex(cacheVersion) {
        const request = new Request('index.json');
        const cache = await caches.open(`search-index-${cacheVersion}`);
        const cachedResponse = await cache.match(request);
        const response = cachedResponse || await fetch(request);
        if (!cachedResponse) {
            cache.put(request, response.clone());
        }
        return response.json();
    }

    function search(index, term, {findAll, isRegex, caseSensitive}) {
        const results = {};
        let numHits = 0;
        const regexContent = isRegex ? term : escapeRegExp(term);
        const regexFlags = caseSensitive ? 'u' : 'iu';
        const regex = new RegExp(regexContent, regexFlags);
        for (const [file, lines] of Object.entries(index)) {
            // TODO: What if the user wants to search multiple lines?
            for (const [lineIndex, line] of lines.entries()) {
                if (regex.test(line)) {
                    results[file] = results[file] || [];
                    results[file].push({
                        content: line,
                        index: lineIndex + 1
                    });
                    if (++numHits === HIT_LIMIT && !findAll) {
                        return {
                            numHits,
                            overflow: true,
                            results
                        };
                    }
                }
            }
        }
        return {
            numHits,
            overflow: false,
            results
        };
    }

    async function onSubmit(event) {
        event.preventDefault();

        const searchSection = document.getElementById('search-results');
        const searchHits = document.getElementById('search-hits');
        const searchStatus = document.getElementById('search-status');
        searchSection.classList.remove('hidden');
 
        while (searchHits.hasChildNodes()) {
            searchHits.removeChild(searchHits.firstChild);
        }

        const formData = new FormData(event.currentTarget);
        const searchTerm = formData.get('search');
        const findAll = formData.get('find-all') === 'on';
        const isRegex = formData.get('is-regex') === 'on';
        const caseSensitive = formData.get('case-sensitive') === 'on';
        const cacheVersion = formData.get('cache-version');

        searchStatus.textContent = 'Retrieving search index...';
        const index = await getSearchIndex(cacheVersion);

        searchStatus.textContent = 'Searching...';
        const {numHits, overflow, results} = search(index, searchTerm, {
            findAll,
            isRegex,
            caseSensitive
        });
        if (Object.keys(results).length === 0) {
            searchStatus.textContent = 'No results.';
        } else {
            searchStatus.textContent = overflow ?
                `Showing first ${HIT_LIMIT} results. Use the 'Find all' option to see all results.` :
                `Found ${numHits} results.`;
            let currentHit = 0;
            for (const [file, lines] of Object.entries(results)) {
                const resultRow = document.createElement('tr');
                const resultText = document.createElement('td');
                resultText.colSpan = 2;
                resultRow.classList.add('table-subsection-header');
                const resultLink = document.createElement('a');
                const fileUrl = `${file}.html`;
                resultLink.href = fileUrl;
                resultLink.textContent = `${file.replace(/\.gml$/, '')}:`;
                resultText.appendChild(resultLink);
                resultRow.appendChild(resultText);
                searchHits.appendChild(resultRow);

                for (const line of lines) {
                    const hitRow = document.createElement('tr');
                    const hitLineNumber = document.createElement('td');
                    const hitLine = document.createElement('td');
                    const hitLineLink = document.createElement('a');
                    hitLineLink.href = `${fileUrl}#L${line.index}`;
                    hitLineLink.textContent = `${line.index}:`;
                    hitLineNumber.appendChild(hitLineLink);
                    hitRow.appendChild(hitLineNumber);
                    hitLine.textContent = line.content;
                    hitRow.appendChild(hitLine);
                    searchHits.appendChild(hitRow);
                    hitRow.classList.add('table-subsection-content');
                }

                if ((++currentHit) % REFRESH_LIMIT === 0) {
                    // Refresh the DOM
                    await wait(0);
                }
            }
        }
    }

    document.addEventListener('DOMContentLoaded', () => {
        const searchForm = document.getElementById('search-form');
        searchForm.addEventListener('submit', onSubmit);
    });
})();
