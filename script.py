#!/usr/bin/env python
import os
import re
import sys
from pathlib import Path
from typing import Dict, List

from jinja2 import Environment, FileSystemLoader, select_autoescape

from data import Data
from index import process_scripts
from util import get_script_path

env = Environment(
    loader=FileSystemLoader('templates'),
    autoescape=select_autoescape(['html'])
)


def parse_text(text: str) -> str:
    text = re.sub(
        r'(?<!`)/',
        '<span class="cc cc-wait">Wait for input</span>',
        text
    )
    text = re.sub(
        r'\^([1-9])(.)',
        r'\2<span class="cc cc-delay">Delay \1<span>\1</span></span>',
        text
    )
    text = re.sub(r'(?<!`)&\s*', '<br>', text)
    text = re.sub(
        r'(?<!`)%',
        '<span class="cc cc-close">Close Message</span>',
        text
    )
    text = re.sub(
        r'\\\\[EM](.)',
        r'<span class="cc-face">Face \1</span>',
        text
    )
    text = re.sub(
        r'\\\\m(.)\*?',
        r'<span class="cc-face">Mini face \1</span> ',
        text
    )
    text = re.sub(
        r'\\\\f(.)\*?',
        r'<span class="cc-face">Mini text \1</span> ',
        text
    )
    text = re.sub(
        r'\\\\c(.)(.*?)(?=\\\\c|$)',
        r'<span class="cc-color cc-\1">\2</span>',
        text
    )
    text = re.sub(r'\\\\T(.)', r'<span class="cc-face">Sound \1</span>', text)
    text = re.sub(r'\\\\F(.)', r'<span class="cc-face">Char \1</span>', text)
    text = re.sub(
        r'\\\\C(.)',
        r'<span class="cc-face">Choice type \1</span>',
        text
    )
    text = re.sub(r'\\"', '"', text)
    text = re.sub(r'`(.)', r'\1', text)
    return text


def highlight_text(matches: re.Match[str]) -> str:
    return env.get_template('highlight/text.html').render(
        before_var=matches[1],
        variable=matches[2],
        after_var=matches[3],
        parsed_text=parse_text(matches[2])
    )


def highlight_text_ch1(matches: re.Match[str], data: Data) -> str:
    return env.get_template('highlight/text.html').render(
        before_var=matches[1],
        variable=matches[2],
        after_var=matches[3],
        parsed_text=parse_text(matches[2])
    )


def highlight_room(matches: re.Match[str], data: Data) -> str:
    if matches[2].isdigit():
        room = data.get_room_by_id(int(matches[2]))
    else:
        room = data.get_room_by_name(matches[2])
        if room is None:
            return matches[0]
    return env.get_template('highlight/room.html').render(
        before_room=matches[1],
        room_name=room.name,
        room_description=room.description
    )


def highlight_enemy(matches: re.Match[str], data: Data) -> str:
    enemy_id = int(matches[2])
    return env.get_template('highlight/enemy.html').render(
        before_enemy=matches[1],
        enemy_id=enemy_id,
        enemy_name=data.get_enemy(enemy_id)
    )


def highlight_flag(matches: re.Match[str], data: Data) -> str:
    flag_id = int(matches[2])
    flag_description = data.get_flag(flag_id)
    if flag_description is None:
        return env.get_template('highlight/flag_not_found.html').render(
            before_flag=matches[1],
            flag_id=flag_id,
            after_flag=matches[3]
        )
    else:
        return env.get_template('highlight/flag_found.html').render(
            before_flag=matches[1],
            flag_id=flag_id,
            flag_description=flag_description,
            after_flag=matches[3]
        )


def highlight_function(
    matches: re.Match[str],
    script_name: str,
    text: Dict[str, List[str]],
    data: Data,
    resolve_references: bool
) -> str:
    function_name = matches[2]
    script_name = f'gml_GlobalScript_{function_name}'
    if script_name not in text:
        # This might be a local function
        return matches[0]
    if resolve_references:
        script_lines = []
        for num_line, line in enumerate(text[script_name]):
            script_lines.append(
                process_line(line, script_name, text, data, False)
            )
            if num_line == 100:
                script_lines.append('...')
                break
        script_content = '\n'.join(script_lines)
    else:
        script_content = None
    return env.get_template('highlight/function.html').render(
        before_function=matches[1],
        script_name=script_name,
        function_name=function_name,
        script_content=script_content
    )


def highlight_alarm(
    matches: re.Match[str],
    script_name: str,
    text: Dict[str, List[str]],
    data: Data,
    resolve_references: bool
) -> str:
    before_alarm = matches[1]
    alarm_content = matches[2]
    alarm_number = int(matches[3])
    content_rest = matches[4]
    script_prefix = '_'.join(script_name.split('_')[:-2])
    script_name = f'{script_prefix}_Alarm_{alarm_number}'
    if script_name not in text:
        # We might be in a with block
        return alarm_content
    # TODO: Deduplicate with above
    if resolve_references:
        script_lines = []
        for num_line, line in enumerate(text[script_name]):
            script_lines.append(
                process_line(line, script_name, text, data, False)
            )
            if num_line == 100:
                script_lines.append('...')
                break
        script_content = '\n'.join(script_lines)
    else:
        script_content = None
    return env.get_template('highlight/alarm.html').render(
        before_alarm=before_alarm,
        alarm_content=alarm_content,
        script_name=script_name,
        script_content=script_content,
        content_rest=content_rest
    )


def process_line(
    line: str,
    script_name: str,
    text: Dict[str, List[str]],
    data: Data,
    resolve_references: bool = True
) -> str:
    # Highlight localized strings
    line = re.sub(
        r'([A-Za-z0-9_]+loc\((?:\d+, )?")((?:[^"\\]|\\.)+)(", "[a-z0-9_-]+"\))',  # noqa: E501
        highlight_text,
        line,
        flags=re.IGNORECASE
    )
    line = re.sub(
        r'(scr_84_get_lang_string(?:_ch1)?\(")([a-zA-Z0-9_-]+)("\))',
        lambda matches: highlight_text_ch1(matches, data),
        line,
        flags=re.IGNORECASE
    )
    # Highlight flags, rooms and enemies
    line = re.sub(
        r'(global\.flag\[)(\d+)(\])',
        lambda matches: highlight_flag(matches, data),
        line,
        flags=re.IGNORECASE
    )
    line = re.sub(
        r'(room_goto\()([A-Za-z0-9_]+)',
        lambda matches: highlight_room(matches, data),
        line,
        flags=re.IGNORECASE
    )
    line = re.sub(
        r'(global\.monstertype\b.*[!=]+\s*)(\d+)',
        lambda matches: highlight_enemy(matches, data),
        line,
        flags=re.IGNORECASE
    )
    # Link to functions and alarms
    line = re.sub(
        r'(\b)(s?cr?_[a-zA-Z0-9_]+)\(',
        lambda matches: highlight_function(matches, script_name, text, data,
                                           resolve_references),
        line,
        flags=re.IGNORECASE
    )
    line = re.sub(
        r'(^|\s+)(alarm\[(\d+)\])(.*)',
        lambda matches: highlight_alarm(matches, script_name, text, data,
                                        resolve_references),
        line,
        flags=re.IGNORECASE
    )

    return line


def render_script(
    script_name: str,
    text: Dict[str, List[str]],
    data: Data
) -> str:
    lines = [
        process_line(line, script_name, text, data)
        for line in text[script_name]
    ]
    return env.get_template('script_page.html').render(
        script_name=script_name,
        lines=lines,
        game=data.get_game_name(),
        links=data.get_game_links(),
    )


def write_script(output: str, script_name: str, output_dir: Path):
    output_path = output_dir / f'{script_name}.html'
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(output)


if __name__ == '__main__':
    data = Data()
    script_name = sys.argv[1]
    script_dir = get_script_path()
    decompiled_dir = script_dir / 'decompiled'
    output_dir = script_dir / 'out'
    os.makedirs(output_dir, exist_ok=True)
    index = process_scripts(data, decompiled_dir)
    rendered = render_script(script_name, index.text, data)
    write_script(rendered, script_name, output_dir)
