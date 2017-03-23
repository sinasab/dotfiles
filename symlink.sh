#!/usr/bin/env bash

function hookup_symlinks () {
  declare -a FILES_TO_SYMLINK=(
  # bash stuff
  'aliases'
  'bash_git_completion'
  'bash_logout'
  'bash_profile'
  'bash_prompt'
  'bash_tweaks'
  'bashrc'
  'extra'
  'inputrc'

  # configs
  'editorconfig'
  'gitconfig'
  'hyper.js'
  'tmux.conf'
  )
  local sourceFile=''
  local targetFile=''
  local file=''
  for file in ${FILES_TO_SYMLINK[@]}; do
    sourceFile="$(pwd)/$file"
    targetFile="$HOME/.$file"
    rm "$targetFile"
    ln -sf $sourceFile $targetFile
    echo "symlinked $file"
  done
}
hookup_symlinks
unset hookup_symlinks
