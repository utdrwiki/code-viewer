# deltarune-viewer
A rewrite of xkeeper's [deltarune-viewer](https://mini.xkeeper.net/private/deltarune/), from PHP into Python, made into a static website. Hosted on [Netlify](https://www.netlify.com/), and made for the purpose of referencing code from [Deltarune Wiki](https://deltarune.fandom.com/).

While this may not be suited for personal use, contributions that make it easier to run locally (especially on Windows) are appreciated. For personal use, you can also see [this repo](https://github.com/Jacky720/deltarune-viewer).

Current version: Deltarune demo 2021 v1.10, itch.io version.

## Prerequisites
- Bash (for running build scripts; [Git Bash](https://git-scm.com/) on Windows can work)
- [Python](https://python.org/) for generating the website

## Building
After installing prerequisites, first install required dependencies of the project using `pip install -r requirements.txt`, then build the site using `./build.sh`. The site is placed by default in the `out` directory. To view the site, (if you have Python installed), run `./dev.sh`. A Bash (or any Linux shell) environment is assumed when running the mentioned commands.

## Disclaimer

This repository is still copyright infringing.

Original data copyright Toby Fox, 8-4, Fangamer, et al. If you wish to have this repository taken down, please email [admin@kocka.tech](mailto:admin@kocka.tech).

## Credits

- Toby Fox, et al: Created [Deltarune](https://deltarune.com/) and all the scripts displayed on the site
- [xkeeper](https://github.com/Xkeeper0): Original version
- [Grossley](https://github.com/Grossley): Adaptation for personal use
- [Jacky720](https://github.com/Jacky720): Changes to annotations, help with making into a static site
- [KockaAdmiralac](https://github.com/KockaAdmiralac): Making into a static site
