importScripts(
    "/static/highlight/highlight.min.js",
    "/static/highlight/gml.min.js"
);

// Process the innerHTML of `table.code`. See script.js.
// This code is brittle. If we overhaul the HTML structure it might break.
// It's also not very rigorous about matching tag names and classes.

/** @param {MessageEvent<string>} event */
onmessage = function (event) {
    let newHTML = '';
    let insideCode = false;
    let preHighlightedDepth = 0;

    for (const chunk of event.data.split(/(<[^>]+>)/)) {
        if (chunk.startsWith("<")) {
            // We need to highlight text inside <code> elements.
            // We don't nest <code> elements.
            if (chunk.startsWith("<code")) {
                insideCode = true;
            } else if (chunk === "</code>") {
                insideCode = false;
            }

            // We don't want to highlight text inside <span class="skip-highlight">.
            // We do nest <span> elements so we need to keep a count of how deep we are.
            if (chunk.startsWith("<span") && chunk.includes("skip-highlight")) {
                preHighlightedDepth = 1;
            } else if (preHighlightedDepth !== 0) {
                if (chunk.startsWith("<span")) {
                    preHighlightedDepth++;
                } else if (chunk === "</span>") {
                    preHighlightedDepth--;
                }
            }

            newHTML += chunk;
            continue;
        }

        if (!insideCode || preHighlightedDepth !== 0) {
            newHTML += chunk;
            continue;
        }

        if (chunk.trim() === "") {
            newHTML += chunk;
            continue;
        }

        // highlight.js expects text input, not HTML input.
        const decoded = chunk.replace(
            /&amp;|&lt;|&gt;/g,
            (char) => ({"&amp;": "&", "&lt;": "<", "&gt;": ">"})[char]
        );
        newHTML += hljs.highlight(decoded, { language: "gml" }).value;
    }

    postMessage(newHTML);
}
