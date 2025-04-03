import hashlib
import json
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Dict, List, Optional

from util import get_script_path


@dataclass
class Room:
    name: str
    description: str


@dataclass
class Config:
    game: str
    links: Dict[str, str]
    cache: int


class Data:
    def __init__(self, game: str):
        self.game = game
        self.enemies: Optional[List[str]] = None
        self.flags: Optional[Dict[int, str]] = None
        self.rooms: Optional[List[Room]] = None
        self.sums: Optional[Dict[str, str]] = None
        self.lang: Optional[Dict[str, str]] = None
        self.config: Optional[Config] = None

    def load_json(self, filename: str) -> Dict[str, str]:
        script_dir = get_script_path()
        json_file = script_dir / 'data' / self.game / f'{filename}.json'
        with open(json_file, 'r') as file:
            return json.load(file)

    def load_textdata(self, scriptname: str) -> Dict[str, str]:
        script_dir = get_script_path()
        lang_file = script_dir / 'out' / 'raw' / f'{scriptname}.gml'
        ret = {}
        textdata_regex = re.compile(
            r"ds_map_add\(global\.text_data_[a-z]+, "
          + r"\"([a-zA-Z0-9_]+)\", ([\"'])(.*)\2\)"
        )
        with open(lang_file, 'r') as file:
            for line in file.readlines():
                if not line.startswith('ds_map_add'):
                    continue
                line = line.replace("' + \"'\" + '", "'")
                line = line.replace('" + \'"\' + "', '"')
                matches = textdata_regex.match(line)
                if matches is not None:
                    ret[matches[1]] = matches[3]
                else:
                    print('Match failed for line:', line)
        print('Got %d lines' % len(ret))
        return ret

    def load_enemies(self) -> List[str]:
        return self.load_json('enemies')

    def load_flags(self) -> Dict[int, str]:
        flags: Dict[str, str] = self.load_json('flags')
        return {int(k): v for k, v in flags.items()}

    def load_rooms(self) -> List[Room]:
        rooms: List[Dict[str, str]] = self.load_json('rooms')
        return [Room(**room) for room in rooms]

    def load_sums(self) -> Dict[str, str]:
        return self.load_json('sums')

    def load_lang(self) -> Dict[str, str]:
        if self.game == 'undertale':
            return self.load_textdata('gml_Script_textdata_en')
        return self.load_json('lang_en')

    def load_config(self) -> Config:
        return Config(**self.load_json('config'))

    def get_enemy(self, enemy_id: int) -> str:
        if self.enemies is None:
            self.enemies = self.load_enemies()
        return self.enemies[enemy_id]

    def get_flag(self, flag_id: int) -> Optional[str]:
        if self.flags is None:
            self.flags = self.load_flags()
        return self.flags.get(flag_id, None)

    def get_room_by_id(self, room_id: int) -> Room:
        if self.rooms is None:
            self.rooms = self.load_rooms()
        return self.rooms[room_id]

    def get_room_by_name(self, room_name: str) -> Optional[Room]:
        if self.rooms is None:
            self.rooms = self.load_rooms()
        for room in self.rooms:
            if room.name == room_name:
                return room
        return None

    def classify_junk(self, filename: Path) -> Optional[str]:
        if self.sums is None:
            self.sums = self.load_sums()
        with open(filename, 'rb') as file:
            hash_sum = hashlib.sha256(file.read()).hexdigest()
            return self.sums.get(hash_sum, None)

    def get_localized_string_ch1(self, key: str) -> str:
        if self.lang is None:
            self.lang = self.load_lang()
        return self.lang[key]

    def get_game_name(self) -> str:
        if self.config is None:
            self.config = self.load_config()
        return self.config.game

    def get_game_links(self) -> Dict[str, str]:
        if self.config is None:
            self.config = self.load_config()
        return self.config.links

    def get_cache_version(self) -> int:
        if self.config is None:
            self.config = self.load_config()
        return self.config.cache
