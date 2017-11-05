#!/usr/bin/env bash
[ -n "$PS1" ] && source ~/.bash_profile;
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
PATH="$PATH:/mnt/c/Program\ Files/Docker/Docker/resources/bin"

# ------------------ aliases
alias gs='git status -s'
alias gcaa='git commit -a --amend --reuse-message=HEAD'
alias ls='ls --color'
alias mv='mv -v'
alias rm='rm -v'
alias cp='cp -v'

# ------------------- general options
export EDITOR="vim"
export LS_COLORS="ow=01;36;40" # ls colors
shopt -s checkwinsize # Update window size after every command
set -o noclobber # prevent file overwrite on stdout redirection
shopt -s nocaseglob; # case-insensitive globbing
shopt -s cdspell; # Autocorrect typos in path names when using `cd`
shopt -s cdable_vars # Define a variable containing a path and you will be able to cd into it

### tab completion stuff ###
# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null
# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"
# Include filenames beginning with a "." in the filename expansion.
shopt -s dotglob
# use extended pattern matching features
shopt -s extglob
# match filenames in case-insensitive fashion
shopt -s nocaseglob

### history stuff ###
# keep history up to date, across sessions, in realtime
#  http://unix.stackexchange.com/a/48113
export HISTCONTROL="erasedups:ignoreboth" # no duplicate entries
export HISTSIZE=100000 # big big history (default is 500)
export HISTFILESIZE=$HISTSIZE # big big history
type shopt &> /dev/null && shopt -s histappend # append to history, don't overwrite it
# Save multi-line commands as one command
shopt -s cmdhist
# Avoid duplicate entries
export HISTCONTROL="erasedups:ignoreboth"
# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"
# Use standard ISO 8601 timestamp
HISTTIMEFORMAT='%F %T ' # %F=%Y-%m-%d, %T=%H:%M:%S (24-hr format)
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
# enable history expansion with space
bind Space:magic-space
# see http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'
