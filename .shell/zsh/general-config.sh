# keybindings
bindkey -v
bindkey "^R" history-incremental-pattern-search-backward

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

# fzf stuff
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh