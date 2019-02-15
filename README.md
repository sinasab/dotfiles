# dotfiles

## Setup - Run a bunch of commands

### General Setup

- Clone the repo, including submodule files:

```bash
$ git clone --recursive https://github.com/sinasabet81/dotfiles.git
# or if you already cloned the repo but didn't initialize the submodules:
$ git submodule update --init --recursive
```

- `cd` into the project directory.
- Symlink files and folders from this repo to your home directory using the shell script:

```bash
$ ./setup/install.sh
```

- Also install some global npm dependencies:

```bash
$ yarn global add \
tldr \
vtop
```

### MacOS-specific Setup

[Install homebrew](https://brew.sh/):

```bash
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Then use it to install everything via the [`Brewfile`](https://github.com/Homebrew/homebrew-bundle):

```bash
$ brew bundle
```

Run this for some automated macos system config:

```bash
$ ./setup/macos/index.sh
```

Then some manual MacOS tweaks

- Map Mouse Button 5 to open Mission Control
- remap caps lock to ctrl

### References

- https://github.com/mathiasbynens/dotfiles
- probably others

### TODOs

- tighten macos settings (automate all of it)
- version control vscode setup
- version control alacritty settings
- add spin-up-able test environment dockerfiles maybe
