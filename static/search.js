(function() {
    'use strict';
    const searchForm = document.getElementById('search-form');
    const searchSection = document.getElementById('search-results');
    const searchList = document.getElementById('search-list');
    const initialFormData = new FormData(searchForm);
    const appId = initialFormData.get('app');
    const appKey = initialFormData.get('key');
    const client = algoliasearch(appId, appKey);
    const index = client.initIndex('deltarune');
    searchForm.addEventListener('submit', async event => {
        event.preventDefault();
        searchSection.classList.remove('hidden');
        while (searchList.hasChildNodes()) {
            searchList.removeChild(searchList.firstChild);
        }
        const formData = new FormData(searchForm);
        const searchTerm = formData.get('search');
        const {hits} = await index.search(searchTerm);
        if (hits.length === 0) {
            const noResults = document.createElement('li');
            noResults.classList.add('no-results');
            noResults.textContent = 'No results.';
            searchList.appendChild(noResults);
        } else {
            for (const {file} of hits) {
                // TODO: Implement search result preview.
                const result = document.createElement('li');
                const resultLink = document.createElement('a');
                resultLink.href = `/${file.replace(/\.gml$/, '.html')}`;
                resultLink.textContent = file;
                result.appendChild(resultLink);
                searchList.appendChild(result);
            }
        }
    });
})();
