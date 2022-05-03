#!/bin/bash
cd "${0%/*}"

output_dir="$1"
script_name="$2"
if [ -z "$output_dir" ]
then
    output_dir=out
fi

if [ -f .env ]
then
    source .env
fi

cp static/* "$output_dir"
cp -r data "$output_dir"
cp node_modules/algoliasearch/dist/algoliasearch-lite.umd.js "$output_dir"
if [ -z "$script_name" ]
then
    echo "Rebuilding entire site."
    rm -f "$output_dir/*.html"
    ALGOLIA_APP="$ALGOLIA_APP" ALGOLIA_KEY_PUBLIC="$ALGOLIA_KEY_PUBLIC" php index.php > "$output_dir/index.html"

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
