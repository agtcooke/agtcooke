# WSL

Things I need for WSL to be functional for my workflows.

I think most of these things can be reduced, but for the time being, this meets my needs.

## `/profile`

Basically my dotfiles so far.

`.bashrc` is a combination of the default Ubuntu bash profile and git tweaks to my prompt.

`.gitconfig` is _mostly_ personal preferences, but the `difftool`, `mergetool`, and `editor` sections may be of use.

## `/glue`

Helpers to live in a WSL<->Windows world.

`diff.sh` shuffles the git diff temp file over to Windows at `C:\temp`, and then proceeds with the diff. WSL is opinionated about not letting Windows edit files that live in WSL (`wslpath`, for example, refuses to map the path, without explicit explanation), so we need do some shuffling.

`editor.sh` separates all parameters (`$@`) from the last parameter (the thing to edit), `wslpath`'s the last parameter, and carries on.

## `setup.sh`

A maybe pointless attempt at automating setup of these things.