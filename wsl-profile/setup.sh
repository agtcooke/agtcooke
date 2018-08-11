#!/bin/bash

WINMERGE_FILE_NAME="WSLMerge.sh"

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
SOURCE_DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"

echo "Replacing .bashrc"
rm ~/.bashrc 2> /dev/null
ln -s $SOURCE_DIR/.bashrc ~/.bashrc

echo "Replacing .gitconfig"
rm ~/.gitconfig 2> /dev/null
ln -s $SOURCE_DIR/.gitconfig ~/.gitconfig

echo "Adding $WINMERGE_FILE_NAME"
rm ~/$WINMERGE_FILE_NAME 2> /dev/null
ln -s $SOURCE_DIR/$WINMERGE_FILE_NAME ~/$WINMERGE_FILE_NAME

echo "Done"
