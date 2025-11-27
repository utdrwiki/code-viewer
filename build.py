import os
import zipfile
import argparse
import requests

from io import BytesIO
from loguru import logger
from os.path import dirname, join, exists, relpath
from shutil import rmtree, copyfile
from tqdm import tqdm
from generate import generate
from data import Data
from typing import Optional

DIR = dirname(__file__)
STATIC = join(DIR, "static")

def download(url: str, file: str):
    data = requests.get(url).content
    parent = dirname(file)

    if not exists(parent):
        os.makedirs(parent)
    
    with open(file, "wb") as f:
        f.write(data)

def build(game: str, chapter: Optional[str]):
    OUT = join(DIR, "out", game)

    RAW = join(OUT, "raw", chapter) if chapter is not None else join(OUT, "raw")
    INPUT = join(DIR, f"decompiled-{game}", chapter) if chapter is not None else join(DIR, f"decompiled-{game}")

    logger.info(f"Building chapter: {chapter}")
    logger.info("Finding script files...")

    scripts: list[str] = []

    for root, _, files in os.walk(INPUT):
        for name in files:
            if name.lower().endswith(".gml"):
                scripts.append(join(root, name))

    logger.info("Copying script files...")

    for file in tqdm(scripts):
        rel = relpath(file, INPUT)
        target = join(RAW, rel)
        txt = join(RAW, ".".join(rel.split(".")[:-1]) + ".txt")
        parent = dirname(target)

        if not exists(parent):
            os.makedirs(parent)

        copyfile(file, target)
        copyfile(file, txt)

def run(game: str):
    DATA = Data(game)
    OUT = join(DIR, "out", game)
    STATIC_OUT = join(OUT, "static")

    if exists(OUT):
        logger.info("Clearing existing output...")
        rmtree(OUT)

    os.makedirs(OUT)

    chapters = DATA.get_chapters()

    if chapters is not None and len(chapters) > 0:
        logger.info("Building chapters...")

        for chapter in chapters.keys():
            build(game, chapter)
    else:
        build(game, None)

    logger.info("Copying static files...")

    static_files: list[str] = []

    for root, _, files in os.walk(STATIC):
        for file in files:
            static_files.append(relpath(join(root, file), STATIC))

    os.makedirs(STATIC_OUT)

    for file in tqdm(static_files):
        out_path = join(STATIC_OUT, file)
        parent = dirname(out_path)

        if not exists(parent):
            os.makedirs(parent)

        copyfile(join(STATIC, file), out_path)

    copyfile(join(DIR, "_headers"), join(OUT, "_headers"))

    logger.info("Downloading font...")

    font_url = "https://download-cdn.jetbrains.com/fonts/JetBrainsMono-2.304.zip"
    data = requests.get(font_url).content

    with zipfile.ZipFile(BytesIO(data), "r") as zip:
        zip.extractall(STATIC_OUT)

    logger.info("Downloading highlight.js...")

    download(
        "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.11.1/highlight.min.js",
        join(STATIC_OUT, "highlight", "highlight.min.js")
    )

    download(
        "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.11.1/languages/gml.min.js",
        join(STATIC_OUT, "highlight", "gml.min.js")
    )

    download(
        "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.11.1/styles/github-dark.min.css",
        join(STATIC_OUT, "highlight", "github-dark.min.css")
    )

    logger.info("Generating website...")

    generate(game)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description='Generates the code viewer website.'
    )

    parser.add_argument(
        'game',
        type=str,
        help='game for which to generate the website'
    )
    
    args = parser.parse_args()

    run(args.game)
