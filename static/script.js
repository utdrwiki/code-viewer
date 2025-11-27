(function () {
    'use strict';
    function highlightHash() {
        const selectedRow = document.querySelector('.code .selected');

        if (selectedRow) {
            selectedRow.classList.remove("selected");
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

    const elements = [
        ...document.getElementsByClassName("code-line"),
    ];

    // Unfortunately a standard document tree walker doesn't work here - it misses quite a lot of nodes.
    // ¯\_(ツ)_/¯

    /** @param {Node} el */
    const getTextNodes = (el) => {
        const nodes = [];

        for (const child of el.childNodes) {
            if (
                child.nodeType == Node.ELEMENT_NODE &&
                child.classList.contains("highlighted")
            ) continue;

            if (child.nodeType == Node.TEXT_NODE) {
                nodes.push(child);
            } else {
                nodes.push(...getTextNodes(child));
            }
        }

        return nodes;
    };

    for (const el of elements) {
        // Highlighting has to be done super carefully and manually like this, otherwise
        // the annotations won't show up and get overwritten by highlight.js.

        for (const node of getTextNodes(el)) {
            if (node.textContent.trim() == "") continue;

            const replacement = document.createElement("code");

            replacement.classList.add("highlighted");
            replacement.innerHTML = hljs.highlight(node.textContent, { language: "gml" }).value;

            node.replaceWith(replacement);
        }
    }

    window.addEventListener("hashchange", highlightHash);
})();
