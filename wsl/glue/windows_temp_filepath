#!/bin/bash

# Launches VS Code as the git editor.
# Borrowed from: https://github.com/Microsoft/vscode/issues/27101
# Note: We're using `wslpath` provided by WSL as of the most recent Win10 update.

#extract last argument (the file path)
for last; do true; done

#get all the initial command arguments
all="${@:1:$(($#-1))}"

#launch code with windows path
code $all `wslpath -w $last`