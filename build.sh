#!/bin/bash
set -e
cd "${0%/*}"
OUTPUT="out-$1"
rm -rf $OUTPUT
mkdir -p $OUTPUT
cp -r "decompiled-$1" $OUTPUT/raw
find $OUTPUT/raw -name "*.gml" -exec sh -c 'cp "$1" "${1%.gml}.txt"' _ {} \;
cp -r static $OUTPUT
python generate.py "$1"
