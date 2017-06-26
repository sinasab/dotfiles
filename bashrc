#!/usr/bin/env bash
[ -n "$PS1" ] && source ~/.bash_profile;
export PATH="/home/sina/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
PATH="$PATH:/mnt/c/Program\ Files/Docker/Docker/resources/bin"
