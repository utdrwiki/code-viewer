#!/usr/bin/env python
import os

from jinja2 import Environment, FileSystemLoader, select_autoescape

from data import Data
from index import process_scripts, write_index
from script import render_script, write_script
from util import get_script_path


if __name__ == '__main__':
    data = Data()
    script_dir = get_script_path()
    decompiled_dir = script_dir / 'decompiled'
    output_dir = script_dir / 'out'
    os.makedirs(output_dir, exist_ok=True)
    env = Environment(loader=FileSystemLoader('templates'), autoescape=select_autoescape(['html']))
    index = process_scripts(data, decompiled_dir)
    write_index(index, data, output_dir)
    for script in index.text.keys():
        rendered = render_script(script, index.text, data)
        write_script(rendered, script, output_dir)
