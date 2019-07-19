ZSH_CUSTOM="$HOME/.shell/zsh/omz-custom"
ZSH_THEME="spaceship"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
plugins=( \
  colorize \
  command-not-found \
  copybuffer \
  copydir \
  cp \
  copyfile \
  docker \
  docker-compose \
  git \
  gitfast \
  history-substring-search \
  kubectl \
  minikube \
  mosh \
  # npm \
  # nvm \
  vi-mode \
  vscode \
  yarn \
  zsh-autosuggestions \
  zsh-history-substring-search \
  zsh_reload \
  zsh-syntax-highlighting)  #  needs to be last one sourced

source $ZSH/oh-my-zsh.sh
