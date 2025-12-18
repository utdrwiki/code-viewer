#!/usr/bin/env python

import argparse
import hashlib
import os
import re
from pathlib import Path
from typing import Dict, List, Set

from jinja2 import Environment, FileSystemLoader, select_autoescape
from loguru import logger
from tqdm import tqdm

from data import Data
from index import ScriptIndex, process_scripts, write_index
from script import render_script, write_script
from util import get_script_path

type AggregateIndex = Dict[str, List[str]]

env = Environment(
    loader=FileSystemLoader('templates'),
    autoescape=select_autoescape(['html']),
)

UNDERSCORE_NORMALIZATION_REGEX = re.compile(r'_{2,}')


def process_indices(indices: List[ScriptIndex], data: Data) -> AggregateIndex:
    aggregate: AggregateIndex = {}
    checksums: Dict[str, Set[str]] = {}

    logger.info('Processing indices...')

    for chapter_idx, index in tqdm(enumerate(indices)):
        for script, text in index.text.items():
            if script not in aggregate:
                aggregate[script] = []
                checksums[script] = set()

            fulltext_bytes = '\n'.join(text).encode('utf-8')
            checksum = hashlib.md5(fulltext_bytes).hexdigest()
            chapters = data.get_chapters()

            if chapters is None:
                raise Exception('No chapters list found!')

            if checksum not in checksums[script]:
                chapter = list(chapters.keys())[chapter_idx]

                checksums[script].add(checksum)
                aggregate[script].append(chapter)

    return aggregate


def write_redirects(aggregate: AggregateIndex, data: Data, output_dir: Path):
    redirects: Dict[str, str] = {}
    chapters = data.get_chapters() or {}

    logger.info('Writing redirects...')

    for script, chapter_indices in tqdm(aggregate.items()):
        if len(chapter_indices) > 1:
            if not os.path.exists(output_dir):
                os.makedirs(output_dir)

            with open(output_dir / f'{script}.html', 'w') as disambig_file:
                disambig_file.write(
                    env.get_template('disambig.html').render(
                        script_name=script,
                        chapters=[(i, chapters[i]) for i in chapter_indices],
                        game=data.get_game_name(),
                        links=data.get_game_links(),
                        footer=data.get_game_footer(),
                    )
                )
        else:
            redirects[f'/{script}*'] = f'/{chapter_indices[0]}/{script}.html'

        normalized = UNDERSCORE_NORMALIZATION_REGEX.sub('_', script)
        if script != normalized and normalized not in aggregate:
            for idx in chapter_indices:
                redirects[f'/{idx}/{normalized}*'] = f'/{idx}/{script}.html'

    with open(output_dir / '_redirects', 'w') as redirects_file:
        for old_path, new_path in redirects.items():
            redirects_file.write(f'{old_path} {new_path}\n')


def write_chapter_index(data: Data, output_dir: Path):
    chapters = (data.get_chapters() or {}).items()

    logger.info('Rendering chapter index...')

    with open(output_dir / 'index.html', 'w') as index_file:
        index_file.write(
            env.get_template('chapters.html').render(
                chapters=chapters,
                game=data.get_game_name(),
                links=data.get_game_links(),
                footer=data.get_game_footer(),
            )
        )


def generate(game: str):
    data = Data(game)
    chapters = data.get_chapters()
    script_dir = get_script_path()
    decompiled_dir = script_dir / f'decompiled-{game}'
    output_dir = script_dir / 'out' / game

    os.makedirs(output_dir, exist_ok=True)

    if chapters is not None:
        indices = []

        for chapter_id, chapter in chapters.items():
            decompiled_dir_ch = decompiled_dir / chapter_id
            output_dir_ch = output_dir / chapter_id

            os.makedirs(output_dir_ch, exist_ok=True)

            data.select_chapter(chapter_id, chapter)

            logger.info(f"['{chapter}'] Creating index...")

            index = process_scripts(data, decompiled_dir_ch)

            logger.info(f"['{chapter}'] Rendering index...")

            write_index(index, data, output_dir_ch)

            logger.info(f"['{chapter}'] Rendering scripts' pages...")

            for script in tqdm(index.text.keys()):
                rendered = render_script(script, index.text, data)

                write_script(rendered, script, output_dir_ch)

            data.select_chapter(None, None)
            indices.append(index)

        logger.info('Linking chapters...')

        write_redirects(process_indices(indices, data), data, output_dir)
        write_chapter_index(data, output_dir)
    else:
        logger.info('Creating index...')

        index = process_scripts(data, decompiled_dir)

        logger.info('Rendering index...')

        write_index(index, data, output_dir)

        logger.info("Rendering scripts' pages...")

        for script in tqdm(index.text.keys()):
            rendered = render_script(script, index.text, data)

            write_script(rendered, script, output_dir)


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

    generate(args.game)
