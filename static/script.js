window.addEventListener('DOMContentLoaded', function() {
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

    window.addEventListener("hashchange", highlightHash);

    // We want to apply syntax highlighting. We have two problems.
    //
    // First, we have annotations that we want to preserve and not highlight.
    // So we can't just let highlight.js go to town, we have to be careful.
    //
    // Second, the natural approach of calling replaceWith() on text nodes
    // is extremely slow for large pages like gml_GlobalScript_scr_text,
    // locking up the browser for ten seconds or more. Firefox spends >80%
    // of its runtime just calling replaceWith().
    //
    // So we process the HTML manually, as text, and set innerHTML a single
    // time at the end. This also lets us use a web worker to highlight
    // in the background without blocking the main thread. (You can't send
    // DOM nodes to web workers.)
    //
    // See script-highlighter.js for the gory details.

    const table = document.querySelector("table.code");
    const worker = new Worker("/static/script-highlighter.js");
    /** @param {MessageEvent<string>} event */
    worker.onmessage = function (event) {
        table.innerHTML = event.data;
        highlightHash();
        worker.terminate();
    };
    worker.postMessage(table.innerHTML);
});
