source $HOME/.shell/common/index.sh
source $HOME/.shell/zsh/index.sh

# keybindings
bindkey -v
bindkey "^R" history-incremental-pattern-search-backward

# history options
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST               # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY        # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY      # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY           # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST  # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS        # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS    # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS       # Do not display a line previously found.
setopt HIST_IGNORE_SPACE       # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS       # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY             # Don't execute immediately upon history expansion.
setopt HIST_BEEP               # Beep when accessing nonexistent history

# autocomplete stuff
setopt always_to_end # When completing from the middle of a word, move the cursor to the end of the word
setopt auto_menu # show completion menu on successive tab press. needs unsetop menu_complete to work
setopt auto_name_dirs # any parameter that is set to the absolute name of a directory immediately becomes a name for that directory
setopt complete_in_word # Allow completion from within a word/phrase
unsetopt menu_complete # do not autoselect the first completion entry
unsetopt correct_all # don't ask if i misspelled stuff

# misc shell options
setopt auto_cd      # chdir to directory if we type its name only
setopt auto_pushd    # put directory on dir stack after chdir
setopt pushd_ignore_dups  # do not place duplicates on directory stack
setopt interactive_comments # allow comments even in interactive shells
setopt glob_complete    # set complete globing
setopt extended_glob    # set extended globing
setopt null_glob    # delete word if no match is found
setopt mail_warning    # warn if mail file was accessed from last login
setopt nobeep      # prevent beeps
unsetopt null_glob    # prevent expanding of non matched globs to *
