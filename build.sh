#!/bin/bash

# Use the new build system! :)
python3 build.py "$@"

# set -e
# cd "${0%/*}"
# rm -rf out
# mkdir -p out
# cp -rL "decompiled-$1" out/raw
# find out/raw -name "*.gml" -exec sh -c 'cp "$1" "${1%.gml}.txt"' _ {} \;
# cp -r static out
# cp _headers out
# python generate.py "$1"
