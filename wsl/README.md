# WSL

Things I need for WSL to be functional for my workflows.

I think most of these things can be reduced, but for the time being, this meets my needs.

## Using a VPN with WSL

There are [known](https://github.com/Microsoft/WSL/issues/1350) [issues](https://github.com/Microsoft/WSL/issues/416) using a VPN with WSL. [This is the best solution I've found](https://gist.github.com/matthiassb/9c8162d2564777a70e3ae3cbee7d2e95).

## `/profile`

Basically my dotfiles so far.

`.bashrc` is a combination of the default Ubuntu bash profile and git tweaks to my prompt.

`.gitconfig` is _mostly_ personal preferences, but the `difftool`, `mergetool`, and `editor` sections may be of use.

## `/glue`

Helpers to live in a WSL<->Windows world.

`diff.sh` shuffles the git diff temp file over to Windows at `C:\temp`, and then proceeds with the diff. WSL is opinionated about not letting Windows edit files that live in WSL (`wslpath`, for example, refuses to map the path, without explicit explanation), so we need do some shuffling.

## `ConEmu.xml`

My config file for `Cmder`. As of right now it needs to be manually copied to %APPDATA%.

## `setup.sh`

A maybe pointless attempt at automating setup of these things.