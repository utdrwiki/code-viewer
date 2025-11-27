// Redstone's Incredible Smooth Navigator(TM)
// Definitely not just something slapped together in 5 minutes for another project.
// Nope.... definitely not.... yup....
// Hey, if it works, it works. :P
// You could say it's VERY VERY INTERESTING-

const bodyHistory = [];
const content = {};

const fetchContent = async (url) => {
    if (!content[url]) content[url] = await (await fetch(url)).text();
};

const registerHandler = () => {
    const as = document.getElementsByTagName("a");

    for (const a of as) {
        if (a.href == undefined || a.href == "" || !a.classList.contains("dir")) continue;

        a.addEventListener("click", async (ev) => {
            ev.preventDefault();
            ev.stopPropagation();

            await fetchContent(a.href);

            history.pushState({}, "", a.href);
            bodyHistory.push(document.body.innerHTML);
            document.body.innerHTML = content[a.href];
            registerHandler();
        });

        a.addEventListener("mouseover", () => fetchContent(a.href));
    }
};

window.addEventListener("popstate", (_ev) => {
    const prev = bodyHistory.pop();

    if (prev) {
        document.body.innerHTML = prev;
        registerHandler();
    }
});

registerHandler();
