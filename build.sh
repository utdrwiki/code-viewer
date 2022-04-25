#!/bin/bash
cd "${0%/*}"

output_dir="$1"
script_name="$2"
if [ -z "$output_dir" ]
then
    echo "Please specify an output directory as the first argument."
    exit 1
fi

cp style.css "$output_dir"
cp script.js "$output_dir"
if [ -z "$script_name" ]
then
    echo "Rebuilding entire site."
    rm -f "$output_dir/*.html"
    php index.php > "$output_dir/index.html"

    files=`find decompiled -name "*.gml"`
    count=`echo "$files" | wc -l`
    i=0

    IFS=$'\n'
    for file in `echo "$files"`
    do
        ((i++))
        file=`echo "$file" | sed -e 's|^decompiled/\(.*\)[.]gml$|\1|'`
        php index.php "$file.gml" > "$output_dir/$file.html"
        if [ -z "$NO_PROGRESS" ]
        then
            echo -ne "\r$i/$count"
        fi
    done
else
    echo "Rebuilding $script_name.html"
    php index.php "$script_name.gml" > "$output_dir/$script_name.html"
fi

echo -e "\nDone"
