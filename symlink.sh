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
  local sourceDir="$(pwd)"

  # backup any dotfiles that are replaced into ~/dotfiles_old/$backupFolder
  local dotfilesOld="$HOME/dotfiles_old/"
  local backupFolder="$dotfilesOld""backup_$(date "+%Y-%m-%d-%H-%M-%S")"
  # create ~/dotfiles_old if it doesn't exist
  [ -d "$dotfilesOld" ] || mkdir "$dotfilesOld"

  # used inside of the loop
  local newFile=''
  local oldFile=''
  local file=''

  # for tracking backups, successes, and failures
  declare -a BACKEDUP_FILES=()
  declare -a SUCCESSFUL_FILES=()
  declare -a FAILED_FILES=()

  echo -e "beginning setup! this will symlink a bunch of dotfiles and back up any that are replaced.\n\n"
  for file in ${FILES_TO_SYMLINK[@]}; do
    newFile="$sourceDir/$file"
    oldFile="$HOME/.$file"

    [ -f "$oldFile" ] && \
      BACKEDUP_FILES+=("~/.$file") && \
      mv "$oldFile" "$backupFolder"
    if [ -f "$newFile" ]; then
      ln -sf $newFile $oldFile && \
        SUCCESSFUL_FILES+=("$file") || \
        FAILED_FILES+=("$file")
    else
      FAILED_FILES+=("$file")
    fi
  done
  # log what was backed up, successes, and failures.
  # it's good to reflect.
  [ ${#BACKEDUP_FILES[@]} -ne 0 ] && \
    echo -e "These files were backed up to $backupFolder:\n${BACKEDUP_FILES[@]}\n"
  [ ${#SUCCESSFUL_FILES[@]} -ne 0 ] && \
    echo -e "These files were symlinked successfully:\n${SUCCESSFUL_FILES[@]}\n"
  [ ${#FAILED_FILES[@]} -ne 0 ] && \
    echo -e "These files weren't symlinked successfully:\
      \n${FAILED_FILES[@]}\n" && \
    echo "Perhaps some of these files were missing from $sourceDir?\n"
}
hookup_symlinks
unset hookup_symlinks
