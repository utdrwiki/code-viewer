# GameMaker code viewer

A rewrite of xkeeper's [deltarune-viewer](https://mini.xkeeper.net/private/deltarune/), from PHP into Python, made into a static website. Hosted on [Netlify](https://www.netlify.com/), and made for the purpose of referencing code from the following wikis:

- [Undertale Wiki](https://undertale.wiki/) ([viewer](https://code.undertale.wiki/))
- [Deltarune Wiki](https://deltarune.wiki/) ([viewer](https://code.deltarune.wiki/))
- [Undertale Yellow Wiki](https://undertaleyellow.wiki.gg/) ([viewer](https://code.yellow.undertale.wiki/))

While this may not be suited for personal use, contributions that make it easier to run locally (especially on Windows) are appreciated. For personal use, you can also see [this repo](https://github.com/Jacky720/deltarune-viewer).

## Prerequisites

- Bash (for running build scripts; [Git Bash](https://git-scm.com/) on Windows can work)
- [Python](https://python.org/) for generating the website

## Building

Download either Undertale, Deltarune, or Undertale Yellow and extract their scripts using [UndertaleModTool](https://github.com/UnderminersTeam/UndertaleModTool)'s `ExportAllCode.csx` script. The scripts need to be located in `decompiled-{undertale,deltarune,undertaleyellow}` directories.

After installing prerequisites, first install required dependencies of the project using `pip install -r requirements.txt`, then build the site using `./build.sh [game]`. The site is placed by default in the `out` directory. To view the site after building, (if you have Python installed), run `./dev.sh`. A Bash (or any Linux shell) environment is assumed when running the mentioned commands.

## Disclaimer

While this repository no longer contains Undertale, Deltarune, or Undertale Yellow code directly, the websites that build out of this repository contain content by Toby Fox, 8-4, Fangamer, Team Undertale Yellow, etc. If you have copyright concerns about this repository, please email [admin@undertale.wiki](mailto:admin@undertale.wiki).

## Credits

- Toby Fox, et al: Created [Undertale](https://undertale.com/), [Deltarune](https://deltarune.com/) and all the scripts displayed on their respective sites
- Team Undertale Yellow: Created [Undertale Yellow](https://gamejolt.com/games/UndertaleYellow/136925) and all the scripts displayed on its site
- [xkeeper](https://github.com/Xkeeper0): Original version
- [Grossley](https://github.com/Grossley): Adaptation for personal use
- [Jacky720](https://github.com/Jacky720): Changes to annotations, help with making into a static site
- [KockaAdmiralac](https://kocka.tech): Rewriting in Python and turning into static sites for wiki use
