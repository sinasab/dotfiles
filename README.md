# dotfiles

## Setup

- Either clone this repo with `git clone --recursive` or download the submodules
  with `git submodule update --init --recursive`

### Run commands

Symlink files and folders from this repo to your home directory using the shell script

```bash
$ bash ./setup/install.sh
```

[Install homebrew](https://brew.sh/):

```bash
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Then use it to install everything via the [`Brewfile`](https://github.com/Homebrew/homebrew-bundle):

```bash
$ brew bundle
```

```bash
$ yarn global add vtop
```

### Install

- apply hack font to os, and +colors to iterm2

### Additional system customizations

```bash
$ bash ./setup/macos.sh
```

### Other

- remap caps lock, stuff like that
