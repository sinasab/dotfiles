#!/usr/bin/env bash
# load these dotfiles
for file in ~/.{extra,bash_prompt,aliases,bash_tweaks,bash_git_completion}; do
  [ -r "$file" ] && source $file
  # echo "sourcing $file"
done;
unset file;
