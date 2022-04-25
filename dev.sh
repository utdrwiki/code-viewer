#!/bin/bash
cd "${0%/*}"
python -m http.server -d out
