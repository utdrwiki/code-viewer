# Experimental system for reading & organizing scripts in a better way
# THIS WAS AN EXPERIMENT TO CREATE A SORT OF TREE VIEW OF OBJECTS. DO NOT ATTEMPT TO USE THIS IN PROD, IT WILL NOT WORK!

import os
import re

from os.path import dirname, exists, join
from shutil import copyfile

DEBUG = False

DIR = dirname(__file__)
NAME_RE = re.compile(r"(.*)_(Create|Draw|Step|Alarm|Destroy|PreCreate)_\d+$", re.MULTILINE)
OTHER_RE = re.compile(r"(.*)_Other_\d+$", re.MULTILINE)
COLLISION_RE = re.compile(r"(.*)_Collision_(.*)$", re.MULTILINE)

# Name types (my best guesses):
# - gml_GlobalScript_[function_name] = Global-scope function (name = function_name)
# - gml_GlobalScript_scr_[function_name] = Same as above, but with the 'scr_' prefix
# - gml_Object_(obj_)[class]_[function_name]_[idx] = Function in a class/object, index is if there are duplicates(?)
#                                                    the 'obj_' prefix is optional.
#    - Create = function, constructor
#    - Draw = function, called when drawn on screen
#    - Step = function, called each tick/step/update
#    - Alarm = function, some sort of custom event
#    - Collision_[obj] = funciton, called on collision with the other obj
#    - Destroy = function, destructor
#    - PreCreate = function, called before constructor(?)

class ScriptKind:
    prefix: str
    name: str

    def __init__(self, prefix: str, name: str):
        self.prefix = prefix
        self.name = name

KIND_SCRIPT = ScriptKind("gml_", "Script")
KIND_GLOBAL = ScriptKind("gml_GlobalScript_", "Global")
KIND_GLOBAL_SCR = ScriptKind("gml_GlobalScript_scr_", "Global")
KIND_OBJECT = ScriptKind("gml_Object_", "Object")
KIND_OBJECT_OBJ = ScriptKind("gml_Object_obj_", "Object")

class ScriptInfo:
    kind: ScriptKind
    name: str
    id: str

    def __init__(self, kind: ScriptKind, name: str):
        self.kind = kind
        self.name = name
        self.id = kind.prefix + name
    
class ObjectScriptInfo(ScriptInfo):
    obj: str

    def __init__(self, kind: ScriptKind, obj: str, name: str, id: str):
        self.kind = kind
        self.name = name
        self.obj = obj
        self.id = id

def process(game: str, chapter: str):
    SCRIPTS = join(DIR, f"decompiled-{game}", chapter)
    OUT = join(DIR, "sorted", game, chapter)
    GLOBALS = join(OUT, "globals")
    OTHER = join(OUT, "other")
    OBJECTS = join(OUT, "objects")

    global_scripts: list[ScriptInfo] = []
    object_scripts: list[ScriptInfo] = []
    other_scripts: list[ScriptInfo] = []

    obj_names: list[str] = []

    for script in os.listdir(SCRIPTS):
        if not script.endswith(".gml"):
            continue

        kind = KIND_SCRIPT
        name = script.removesuffix(".gml").removeprefix("gml_")

        if name.startswith("GlobalScript_"):
            kind = KIND_GLOBAL_SCR if name.startswith("GlobalScript_scr_") else KIND_GLOBAL
            name = name.removeprefix("GlobalScript_").removeprefix("scr_")
            global_scripts.append(ScriptInfo(kind, name))

            if DEBUG:
                print(f"[1] Found ({kind.name}) {name} - {script}")
        elif name.startswith("Object_"):
            kind = KIND_OBJECT_OBJ if name.startswith("Object_obj_") else KIND_OBJECT
            name = name.removeprefix("Object_").removeprefix("obj_")
            object_scripts.append(ScriptInfo(kind, name))

            if NAME_RE.match(name) is not None:
                obj_names.append(NAME_RE.sub(r"\1", name))
            elif OTHER_RE.match(name) is not None:
                obj_names.append(OTHER_RE.sub(r"\1", name))
            elif COLLISION_RE.match(name) is not None:
                obj_names.append(COLLISION_RE.sub(r"\1", name))

            if DEBUG:
                print(f"[1] Found ({kind.name}) {name} - {script}")
        else:
            other_scripts.append(ScriptInfo(kind, name))

            if DEBUG:
                print(f"[1] Found ({kind.name}) {name} - {script}")

    obj_names = list(set(obj_names))
    obj_scripts: dict[str, list[ScriptInfo]] = {}

    # TODO: This is gonna be slow as shit lol
    for item in object_scripts:
        found = None

        for name in obj_names:
            if found is None and item.name.startswith(f"{name}_"):
                found = name
                break
            
        if found is None:
            raise Exception(f"Failed to find script group for {item.name}! This is a bug! Report it!")

        real = item.name.removeprefix(f"{found}_")

        if found not in obj_scripts:
            obj_scripts[found] = []

        item = ObjectScriptInfo(item.kind, found, real, item.id)
        obj_scripts[found].append(item)

    if not exists(GLOBALS):
        os.makedirs(GLOBALS)

    if not exists(OTHER):
        os.makedirs(OTHER)

    for scr in global_scripts:
        path = join(GLOBALS, scr.name + ".gml")

        copyfile(join(SCRIPTS, scr.id + ".gml"), path)

    for scr in other_scripts:
        path = join(OTHER, scr.name + ".gml")

        copyfile(join(SCRIPTS, scr.id + ".gml"), path)

    for name, scripts in obj_scripts.items():
        root = join(OBJECTS, name)

        if not exists(root):
            os.makedirs(root)

        for scr in scripts:
            path = join(root, scr.name + ".gml")

            copyfile(join(SCRIPTS, scr.id + ".gml"), path)

for chapter in ["init", "ch1", "ch2", "ch3", "ch4"]:
    process("deltarune", chapter)
