import os
from pathlib import Path
from typing import List


def get_lines(filename: Path) -> List[str]:
    with open(filename, 'r') as file:
        return file.read().strip().splitlines()


def get_script_path() -> Path:
    return Path(os.path.dirname(os.path.realpath(__file__)))
