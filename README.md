# dotfiles

## Setup

- Either clone this repo with `git clone --recursive https://github.com/sinasabet81/dotfiles.git` or download the submodules
  with `git submodule update --init --recursive`

### Run commands

Symlink files and folders from this repo to your home directory using the shell script

```bash
$ ./setup/install.sh
```

[Install homebrew](https://brew.sh/):

```bash
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Then use it to install everything via the [`Brewfile`](https://github.com/Homebrew/homebrew-bundle):

```bash
$ brew bundle
```

Also install some global npm dependencies:

```bash
$ yarn global add \
tldr \
vtop
```

### Install

TODO

- apply hack font to os
- Map Mouse Button 5 to open Missino Control

Run this for some macos system config:

```bash
$ ./setup/macos/index.sh
```

### Other

- remap caps lock, stuff like that TODO

### References

- https://github.com/mathiasbynens/dotfiles
- probably others

### TODOs

- tighten macos settings
- version control vscode setup
- version control alacritty settings
- add spin-up-able test environment
