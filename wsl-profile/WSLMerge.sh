#!/usr/bin/env sh
# Adapted from https://gist.github.com/jaburns/4e9f18a7fe3294970feaa69e4892a681

# As the gist says, the path to this script from .gitconfig mush be absolute. `~/` won't work.

BC4='/mnt/c/Program Files/Beyond Compare 4/BCompare.exe'

get_filename() {
    echo "$1" | sed 's:.*/::'
}

do_diff() {
    local tmp_local="$(get_filename $1)"
    local remote="$(wslpath -wa $2)"
    cp "$1" "/mnt/c/Windows/Temp/$tmp_local"
    "$BC4" "C:\\Windows\\Temp\\$tmp_local" "$remote"
}

case "$1" in
    diff)  do_diff "$2" "$3" ;;
    merge) "$BC4" "$2" "$3" "$4" "$5" ;;
esac