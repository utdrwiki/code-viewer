(function() {
    'use strict';

    const url = new URL(window.location.href);
    let hadSearch = false;

    function filter(term) {
        hadSearch = true;
        const escapedTerm = term
            .replaceAll('<', '&lt;')
            .replaceAll('>', '&gt;');
        for (const section of document.getElementsByClassName('name-section')) {
            let matches = false;
            for (const name of section.lastElementChild.children) {
                const text = name.textContent;
                if (text.includes(term)) {
                    name.classList.remove('hidden');
                    if (term) {
                        name.innerHTML = text
                            .replaceAll(term, `<mark>${escapedTerm}</mark>`);
                    }
                    matches = true;
                } else {
                    name.classList.add('hidden');
                    if (hadSearch) {
                        name.innerHTML = text;
                    }
                }
            }
            if (!matches) {
                section.classList.add('hidden');
            } else {
                section.classList.remove('hidden');
            }
        }
    }

    async function onSubmit(event) {
        event.preventDefault();
        const term = new FormData(event.currentTarget).get('search');
        url.searchParams.set('search', term);
        window.history.replaceState({}, '', url);
        filter(term);
    }

    document.addEventListener('DOMContentLoaded', () => {
        const searchForm = document.getElementById('search-form');
        searchForm.addEventListener('submit', onSubmit);
        searchForm.classList.remove('hidden');
        document.getElementById('loading').remove();
        const term = url.searchParams.get('search');
        if (term) {
            filter(term);
        }
    });
})();
