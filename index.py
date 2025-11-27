#!/usr/bin/env python
import argparse
import json
import os
import re
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Literal, Tuple

from jinja2 import Environment, FileSystemLoader

from data import Data
from util import get_lines, get_script_path


@dataclass
class Entry:
    url: str
    raw_url: str
    name: str
    lines: int


@dataclass
class Section:
    name: str
    entries: Dict[str, List[Entry]] = field(default_factory=lambda: {})


SectionType = Literal['script', 'object', 'roomcc', 'room', 'junk']


@dataclass
class ScriptIndex:
    sections: Dict[SectionType, Section]
    text: Dict[str, List[str]]


def classify(path: Path, data: Data) -> Tuple[SectionType, str]:
    filename = os.path.basename(path)
    if (junk_section := data.classify_junk(path)) is not None:
        return 'junk', junk_section
    if filename.startswith('gml_GlobalScript_'):
        return 'script', 'Global Scripts'
    if filename.startswith('gml_Script_'):
        return 'script', 'Scripts'
    if filename.startswith('gml_Object_'):
        obj_name_match = re.match(
            r'gml_Object_(.*)_((\w+)_(\d+)|Collision_(.*))\.gml',
            filename
        )
        if obj_name_match is None:
            raise ValueError(f'Failed to find object name: {filename}')
        return 'object', obj_name_match.group(1)
    if filename.startswith('gml_RoomCC_'):
        room_name_match = re.match(
            r'gml_RoomCC_(.+)_(\d+)_(\w+)\.gml',
            filename
        )
        if room_name_match is None:
            raise ValueError(f'Failed to find room name: {filename}')
        return 'roomcc', room_name_match.group(1)
    if filename.startswith('gml_Room_'):
        room_name_match = re.match(r'gml_Room_(.+)_(\w+)\.gml', filename)
        if room_name_match is None:
            raise ValueError(f'Failed to find room name: {filename}')
        return 'room', room_name_match.group(1)
    raise ValueError(f'Failed to classify: {filename}')


def process_scripts(data: Data, decompiled_dir: Path) -> ScriptIndex:
    index = ScriptIndex({
        'script': Section('Scripts'),
        'object': Section('Objects'),
        'roomcc': Section('Room Creation Codes'),
        'room': Section('Rooms'),
        'junk': Section('Duplicated or common scripts'),
    }, {})
    files = sorted(f for f in os.listdir(decompiled_dir) if f.endswith('.gml'))
    for file in files:
        filename = decompiled_dir / file
        name = file.replace('.gml', '')
        lines = get_lines(filename)
        section, segment = classify(filename, data)
        if segment not in index.sections[section].entries:
            index.sections[section].entries[segment] = []
        if data.chapter_id is None:
            chapter_segment = ''
        else:
            chapter_segment = f'/{data.chapter_id}'
        index.sections[section].entries[segment].append(Entry(
            url=file.replace('.gml', '.html'),
            raw_url=f"/raw{chapter_segment}/{file.replace('.gml', '.txt')}",
            name=name,
            lines=len(lines)
        ))
        index.text[name] = lines
    return index


def write_index(index: ScriptIndex, data: Data, output_dir: Path) -> None:
    with open(output_dir / 'index.html', 'w', encoding='utf-8') as f:
        env = Environment(loader=FileSystemLoader('templates'))
        f.write(env.get_template('index.html').render(
            sections=index.sections,
            game=data.get_game_name(),
            links=data.get_game_links(),
            cache_version=data.get_cache_version(),
            footer=data.get_game_footer(),
        ))
    with open(output_dir / 'index.json', 'w', encoding='utf-8') as f:
        json.dump(index.text, f, separators=(',', ':'))


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
    script_dir = get_script_path()
    decompiled_dir = script_dir / f'decompiled-{args.game}'
    output_dir = script_dir / 'out'
    os.makedirs(output_dir, exist_ok=True)
    write_index(process_scripts(data, decompiled_dir), data, output_dir)
