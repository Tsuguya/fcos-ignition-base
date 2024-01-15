#!/usr/bin/env bash

files=$(find ./configs -name '*.bu' -not -path './configs/main.bu')

for file in $files; do
    output="${file//bu/ign}"
    envsubst < "$file" | butane -s -o "$output"
done

butane -d ./configs -s configs/main.bu -o output/ignition.ign

find ./configs -name '*.ign' -print0 | xargs -0 rm
