#!/usr/bin/env bash
[ -n "$PS1" ];

source $HOME/.shell/exports.sh
source $HOME/.shell/path.sh
source $HOME/.shell/aliases.sh

# ------------------- general options
shopt -s checkwinsize # Update window size after every command
set -o noclobber # prevent file overwrite on stdout redirection
shopt -s nocaseglob; # case-insensitive globbing
shopt -s cdspell; # Autocorrect typos in path names when using `cd`
shopt -s cdable_vars # Define a variable containing a path and you will be able to cd into it

### tab completion stuff ###
shopt -s dirspell 2> /dev/null # Correct spelling errors during tab-completion
bind "set mark-symlinked-directories on" # Immediately add a trailing slash when autocompleting symlinks to directories
shopt -s dotglob # Include filenames beginning with a "." in the filename expansion.
shopt -s extglob # use extended pattern matching features
shopt -s nocaseglob # match filenames in case-insensitive fashion

### history stuff ###
# keep history up to date, across sessions, in realtime
#  http://unix.stackexchange.com/a/48113
export HISTCONTROL="erasedups:ignoreboth" # no duplicate entries
export HISTSIZE=100000 # big big history (default is 500)
export HISTFILESIZE=$HISTSIZE # big big history
type shopt &> /dev/null && shopt -s histappend # append to history, don't overwrite it
shopt -s cmdhist # Save multi-line commands as one command
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear" # Don't record some commands
# Use standard ISO 8601 timestamp
HISTTIMEFORMAT='%F %T ' # %F=%Y-%m-%d, %T=%H:%M:%S (24-hr format)
bind Space:magic-space # enable history expansion with space
# see http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

# -------------- input config
set bell-style none # Disable beeping and window flashing.
set completion-ignore-case on # Use case-insensitive TAB autocompletion.
set show-all-if-ambiguous off # Auto list TAB completions.
set completion-map-case on # Treat hyphens and underscores as equivalent
set show-all-if-ambiguous on # Display matches for ambiguous patterns at first tab press

[ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash
