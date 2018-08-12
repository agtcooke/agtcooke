#!/usr/bin/env sh
# Adapted from https://gist.github.com/jaburns/4e9f18a7fe3294970feaa69e4892a681

# As the gist says, the path to this script from .gitconfig mush be absolute. `~/` won't work.

windows_temp_filepath="/mnt/c/temp/$(basename $2)"
cp $2 $windows_temp_filepath
"$1" $(wslpath -wa $windows_temp_filepath) $(wslpath -wa $3)
