import argparse
import os
import zipfile
from io import BytesIO
from os.path import dirname, exists, join, relpath
from shutil import copyfile, rmtree
from typing import Optional

import requests
from loguru import logger
from tqdm import tqdm

from data import Data
from generate import generate

DIR = dirname(__file__)
STATIC = join(DIR, 'static')


def download(url: str, file: str):
    data = requests.get(url).content
    parent = dirname(file)

    if not exists(parent):
        os.makedirs(parent)

    with open(file, 'wb') as f:
        f.write(data)


def build(game: str, chapter: Optional[str]):
    out = join(DIR, 'out', game)

    raw = (
        join(out, 'raw', chapter) if chapter is not None else join(out, 'raw')
    )

    input_dir = (
        join(DIR, f'decompiled-{game}', chapter)
        if chapter is not None
        else join(DIR, f'decompiled-{game}')
    )

    logger.info(f'Building chapter: {chapter}')
    logger.info('Finding script files...')

    scripts: list[str] = []

    for root, _, files in os.walk(input_dir):
        for name in files:
            if name.lower().endswith('.gml'):
                scripts.append(join(root, name))

    logger.info('Copying script files...')

    for file in tqdm(scripts):
        rel = relpath(file, input_dir)
        target = join(raw, rel)
        txt = join(raw, '.'.join(rel.split('.')[:-1]) + '.txt')
        parent = dirname(target)

        if not exists(parent):
            os.makedirs(parent)

        copyfile(file, target)
        copyfile(file, txt)


def run(game: str):
    data = Data(game)
    out = join(DIR, 'out', game)
    static_out = join(out, 'static')

    if exists(out):
        logger.info('Clearing existing output...')
        rmtree(out)

    os.makedirs(out)

    chapters = data.get_chapters()

    if chapters is not None and len(chapters) > 0:
        logger.info('Building chapters...')

        for chapter in chapters.keys():
            build(game, chapter)
    else:
        build(game, None)

    logger.info('Copying static files...')

    static_files: list[str] = []

    for root, _, files in os.walk(STATIC):
        for file in files:
            static_files.append(relpath(join(root, file), STATIC))

    os.makedirs(static_out)

    for file in tqdm(static_files):
        out_path = join(static_out, file)
        parent = dirname(out_path)

        if not exists(parent):
            os.makedirs(parent)

        copyfile(join(STATIC, file), out_path)

    copyfile(join(DIR, '_headers'), join(out, '_headers'))

    logger.info('Downloading font...')

    font_url = (
        'https://download-cdn.jetbrains.com/fonts/JetBrainsMono-2.304.zip'
    )
    data = requests.get(font_url).content

    with zipfile.ZipFile(BytesIO(data), 'r') as z:
        z.extractall(static_out)

    logger.info('Downloading highlight.js...')

    hjs_base = 'https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.11.1'

    download(
        f'{hjs_base}/highlight.min.js',
        join(static_out, 'highlight', 'highlight.min.js'),
    )

    download(
        f'{hjs_base}/languages/gml.min.js',
        join(static_out, 'highlight', 'gml.min.js'),
    )

    download(
        f'{hjs_base}/styles/github-dark.min.css',
        join(static_out, 'highlight', 'github-dark.min.css'),
    )

    logger.info('Generating website...')

    generate(game)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description='Generates the code viewer website.'
    )

    parser.add_argument(
        'game',
        type=str,
        help='game for which to generate the website',
    )

    args = parser.parse_args()

    run(args.game)
