import argparse
import json
from pathlib import Path
from typing import Dict, List, Set

from jinja2 import Environment, FileSystemLoader

from data import Data
from util import get_script_path


def collect_names(
    collected_names: Dict[str, Set[str]],
    names: Dict[str, List[str]]
) -> Dict[str, Set[str]]:
    for category, name_set in names.items():
        if category not in collected_names:
            collected_names[category] = set()
        collected_names[category].update(name_set)
    return collected_names


def write_names(names: Dict[str, Set[str]], data: Data, output_dir: Path):
    with open(output_dir / 'names.html', 'w') as names_file:
        env = Environment(loader=FileSystemLoader('templates'))
        names_file.write(
            env.get_template('names.html').render(
                names=names,
                game=data.get_game_name(),
                links=data.get_game_links(),
                footer=data.get_game_footer(),
            )
        )


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description='Generates the names page in the code viewer.'
    )
    parser.add_argument(
        'game',
        type=str,
        help='game for which to generate the website',
    )
    parser.add_argument(
        '--chapter',
        type=str,
        help='chapter for which to generate the website',
    )
    args = parser.parse_args()
    data = Data(args.game)
    script_dir = get_script_path()
    input_dir = script_dir / f'decompiled-{args.game}'
    output_dir = script_dir / 'out' / args.game
    if args.chapter:
        input_dir = input_dir / args.chapter
        output_dir = output_dir / args.chapter
    with open(input_dir / 'names.json', 'r') as names_file:
        write_names(json.load(names_file), data, output_dir)
