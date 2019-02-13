# dotfiles

## Setup

- Either clone this repo with `git clone --recursive` or download the submodules
  with `git submodule update --init --recursive`

### Link

- files and folders from this repo to your home directory

```bash
$ dotfiles=( # list of all dotfiles to do simple symlink for
    .oh-my-zsh \
    .shell \
    .bashrc \
    .editorconfig \
    .gitconfig \
    .gitignore_global \
    .tmux.conf \
    .vimrc \
    .zshrc \
);
old_dotfiles=();
already_linked=();
newly_linked=();
timestamp=$(date +%s) # for old_dotfiles folder name

for d in "${dotfiles[@]}"; do
    if [[ $(readlink ~/$d) = $(pwd)/$d ]]; then
        # ignore items already set up as expected
        already_linked+=$d;
    else
        if [ -f ~/$d ] || [ -d ~/$d ]; then
            # backup things that will be overwritten
            mkdir -p ~/.old_dotfiles_$timestamp/;
            mv -r ~/$d ~/.old_dotfiles_$timestamp/;
            old_dotfiles+=$d;
        fi
        ln -s "$(pwd)/$d" ~/$d;
        newly_linked+=$d;
    fi;
done;

if [[ ${newly_linked[@]} ]]; then
    echo "the following dotfiles were newly symlinked:";
    echo $newly_linked;
    if [[ ${already_linked[@]} ]]; then
        echo "the following dotfiles were already linked correctly:";
        echo $already_linked;
    fi;
    if [[ ${old_dotfiles[@]} ]]; then
        echo "backed up the following old dotfiles into ~/.old_dotfiles_$timestamp:";
        echo $old_dotfiles;
    fi;
else
    echo "no new symlinks added";
fi;
```

### Install

- apply hack font, iterm2

### Run commands

[Install homebrew](https://brew.sh/):

```bash
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Then use it to install everything:

```bash
$ brew install
ethereum \
ffmpeg \
fzf \
gist \
git \
htop \
hub \
nvm \
python \
readline \
tmux \
tree \
vim \
yarn \
zsh
```

```bash
$ brew cask install \
alfred \
android-file-transfer \
cryptomator \
discord \
docker \
firefox \
google-chrome \
iterm2 \
kap \
league-of-legends \
opera \
qbittorrent \
slack \
spectacle \
steam \
sublime-text \
typora \
visual-studio-code \
vlc \
zoomus
```

```bash
$ yarn global add vtop
```

### Configure

- iterm2 to use settings file, colors, and font

### Reference:

- `https://sourabhbajaj.com/mac-setup/Python/`
