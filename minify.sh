#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_directory> <output_directory>"
    exit 1
fi

input_dir="$1"
output_dir="$2"

for file in "$input_dir"/*.json; do
    if [ -f "$file" ]; then
        output_file="$output_dir/$(basename "$file")"
        jq -c . < "$file" > "$output_file"
    fi
done
