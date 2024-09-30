#!/usr/bin/env python
from dataclasses import dataclass, field
import json
import os
import re
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
        obj_name_match = re.match(r'gml_Object_(.*)_((\w+)_(\d+)|Collision_(.*))\.gml', filename)
        if obj_name_match is None:
            raise ValueError(f'Failed to find object name: {filename}')
        return 'object', obj_name_match.group(1)
    if filename.startswith('gml_RoomCC_'):
        room_name_match = re.match(r'gml_RoomCC_(.+)_(\d+)_(\w+)\.gml', filename)
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
    for file in sorted(f for f in os.listdir(decompiled_dir) if f.endswith('.gml')):
        filename = decompiled_dir / file
        name = file.replace('.gml', '')
        lines = get_lines(filename)
        section, segment = classify(filename, data)
        if segment not in index.sections[section].entries:
            index.sections[section].entries[segment] = []
        index.sections[section].entries[segment].append(Entry(
            url=file.replace('.gml', '.html'),
            raw_url=f'raw/{file.replace('.gml', '.txt')}',
            name=name,
            lines=len(lines)
        ))
        index.text[name] = lines
    return index

def write_index(index: ScriptIndex, output_dir: Path) -> None:
    with open(output_dir / 'index.html', 'w', encoding='utf-8') as f:
        env = Environment(loader=FileSystemLoader('templates'))
        f.write(env.get_template('index.html').render(
            sections=index.sections,
            game='Deltarune',
            links={
                'Source code': 'https://github.com/KockaAdmiralac/deltarune-viewer',
                'r/Underminers': 'https://www.reddit.com/r/Underminers/',
                'TCRF': 'https://tcrf.net/Deltarune',
                'Wiki': 'https://deltarune.fandom.com/',
            },
            cache_version=1
        ))
    with open(output_dir / 'index.json', 'w', encoding='utf-8') as f:
        json.dump(index.text, f, separators=(',', ':'))

if __name__ == '__main__':
    data = Data()
    script_dir = get_script_path()
    decompiled_dir = script_dir / 'decompiled'
    output_dir = script_dir / 'out'
    os.makedirs(output_dir, exist_ok=True)
    write_index(process_scripts(data, decompiled_dir), output_dir)
