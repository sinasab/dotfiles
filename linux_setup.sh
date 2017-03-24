#!/usr/bin/env bash

function set_base_dotfiles () {
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
  'vimrc'
  'vim'
  )
  local sourceDir="$(pwd)"

  # backup any dotfiles that are replaced into ~/dotfiles_old/$backupFolder
  local dotfilesOld="$HOME/dotfiles_old/"
  local backupFolder="$dotfilesOld""backup_$(date "+%Y-%m-%d-%H-%M-%S")"
  # create ~/dotfiles_old if it doesn't exist
  [ -d "$dotfilesOld" ] || mkdir "$dotfilesOld"

  # used inside of the loop
  local sourceFile=''
  local oldFile=''
  local file=''

  # for tracking backups, successes, and failures
  declare -a BACKEDUP_FILES=()
  declare -a SUCCESSFUL_FILES=()
  declare -a FAILED_FILES=()

  echo -e "beginning setup! this will symlink a bunch of dotfiles and back up" \
    "any that are replaced.\n\n"
  for file in ${FILES_TO_SYMLINK[@]}; do
    sourceFile="$sourceDir/$file"
    oldFile="$HOME/.$file"

    [ -f "$oldFile" ] && \
      BACKEDUP_FILES+=("~/.$file") && \
      mv "$oldFile" "$backupFolder"
    if [ -f "$sourceFile" ]; then
      ln -sf $sourceFile $oldFile && \
        SUCCESSFUL_FILES+=("$file") || \
        FAILED_FILES+=("$file")
    else
      FAILED_FILES+=("$file")
    fi
  done
  # log what was backed up, successes, and failures.
  # it's good to reflect.
  [ ${#BACKEDUP_FILES[@]} -ne 0 ] && \
    echo -e "These files were backed up to $backupFolder:" \
      "\n${BACKEDUP_FILES[@]}\n"
  [ ${#SUCCESSFUL_FILES[@]} -ne 0 ] && \
    echo -e "These files were symlinked successfully:\n${SUCCESSFUL_FILES[@]}\n"
  [ ${#FAILED_FILES[@]} -ne 0 ] && \
    echo -e "These files weren't symlinked successfully:" \
      "\n${FAILED_FILES[@]}" && \
    echo -e "Perhaps some of these files were missing from $sourceDir?\n"

  # we can log any files in the dotfiles repo that don't get linked
  declare -a UNLINKED_SOURCEDIR_FILES=()
  local skip
  for file in $(ls -a); do
     skip=
     for j in "${SUCCESSFUL_FILES[@]}" "${FAILED_FILES[@]}"; do
         [[ $file == $j ]] && { skip=1; break; }
     done
     [[ -n $skip ]] || UNLINKED_SOURCEDIR_FILES+=("$file")
  done
  [ ${#UNLINKED_SOURCEDIR_FILES[@]} -ne 0 ] && \
    echo -e "These files were in $sourceDir but weren't symlinked:" \
      "\n${UNLINKED_SOURCEDIR_FILES[@]}\n"

}
set_base_dotfiles
unset setup_base_dotfiles

echo -e "\nDone!\n"
