#!/usr/bin/env python
import argparse
import hashlib
import os
from pathlib import Path
from typing import Dict, List, Set

from jinja2 import Environment, FileSystemLoader, select_autoescape

from data import Data
from index import ScriptIndex, process_scripts, write_index
from script import render_script, write_script
from util import get_script_path

AggregateIndex = Dict[str, List[int]]


env = Environment(
    loader=FileSystemLoader('templates'),
    autoescape=select_autoescape(['html'])
)


def process_indices(indices: List[ScriptIndex], data: Data) -> AggregateIndex:
    aggregate: AggregateIndex = {}
    checksums: Dict[str, Set[str]] = {}
    for chapter_idx, index in enumerate(indices):
        for script, text in index.text.items():
            if script not in aggregate:
                aggregate[script] = []
                checksums[script] = set()
            fulltext_bytes = '\n'.join(text).encode('utf-8')
            checksum = hashlib.md5(fulltext_bytes).hexdigest()
            if checksum not in checksums[script]:
                checksums[script].add(checksum)
                aggregate[script].append(chapter_idx)
    return aggregate


def write_redirects(aggregate: AggregateIndex, data: Data, output_dir: Path):
    redirects: Dict[str, str] = {}
    chapters = data.get_chapters() or []
    for script, chapter_indices in aggregate.items():
        if len(chapter_indices) > 1:
            with open(output_dir / f'{script}.html', 'w') as disambig_file:
                disambig_file.write(env.get_template('disambig.html').render(
                    script_name=script,
                    chapters=[chapters[idx] for idx in chapter_indices],
                    game=data.get_game_name(),
                    links=data.get_game_links(),
                    footer=data.get_game_footer(),
                ))
        else:
            chapter = chapters[chapter_indices[0]]
            redirects[f'/{script}*'] = f'/{chapter}/{script}.html'
    with open(output_dir / '_redirects', 'w') as redirects_file:
        for old_path, new_path in redirects.items():
            redirects_file.write(f'{old_path} {new_path}\n')


def write_chapter_index(data: Data, output_dir: Path):
    chapters = data.get_chapters() or []
    with open(output_dir / 'index.html', 'w') as index_file:
        index_file.write(env.get_template('chapters.html').render(
            chapters=chapters,
            game=data.get_game_name(),
            links=data.get_game_links(),
            footer=data.get_game_footer(),
        ))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description='Generates the code viewer website.'
    )
    parser.add_argument(
        'game',
        type=str,
        help='game for which to generate the website'
    )
    args = parser.parse_args()
    data = Data(args.game)
    chapters = data.get_chapters()
    script_dir = get_script_path()
    decompiled_dir = script_dir / f'decompiled-{args.game}'
    output_dir = script_dir / 'out'
    os.makedirs(output_dir, exist_ok=True)
    if chapters is not None:
        indices = []
        for chapter_idx, chapter in enumerate(chapters):
            decompiled_dir_ch = decompiled_dir / chapter
            output_dir_ch = output_dir / chapter
            os.makedirs(output_dir_ch, exist_ok=True)
            data.select_chapter(chapter_idx)
            index = process_scripts(data, decompiled_dir_ch)
            write_index(index, data, output_dir_ch)
            for script in index.text.keys():
                rendered = render_script(script, index.text, data)
                write_script(rendered, script, output_dir_ch)
            data.select_chapter(-1)
            indices.append(index)
        write_redirects(process_indices(indices, data), data, output_dir)
        write_chapter_index(data, output_dir)
    else:
        index = process_scripts(data, decompiled_dir)
        write_index(index, data, output_dir)
        for script in index.text.keys():
            rendered = render_script(script, index.text, data)
            write_script(rendered, script, output_dir)
