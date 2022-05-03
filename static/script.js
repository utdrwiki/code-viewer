(function() {
    'use strict';
    function highlightHash() {
        const selectedRow = document.querySelector('.code .selected');
        if (selectedRow) {
            selectedRow.classList.remove('selected');
        }
        const hash = window.location.hash;
        if (!hash || !hash.startsWith('#L')) {
            return;
        }
        const elem = document.getElementById(hash.substring(1));
        if (!elem) {
            return;
        }
        elem.parentElement.classList.add('selected');
    }
    highlightHash();
    window.addEventListener('hashchange', highlightHash);
})();
