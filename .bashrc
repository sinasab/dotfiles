# sensible defaults
if [ -f ~/sensible.bash ]; then
  source ~/sensible.bash;
else
  echo "bashrc: couldn't find ~/sensible.bash";
fi

# muh aliases
alias cdworkfolder='cd /mnt/c/Users/sina/Documents/projects'
alias node='nodejs'
alias ls='ls --color'

# prompt
function prompt () {
  # This has to be first; exit code of previous command
  local -r EXIT="$?"
  # Escape sequences for formatting
  local -r RESET="\[$(tput sgr0)\]"
  # Solarized colorscheme
  local -r FG_BLACK="\[$(tput setaf 0)\]"
  local -r FG_RED="\[$(tput setaf 1)\]"
  local -r FG_GREEN="\[$(tput setaf 2)\]"
  local -r FG_YELLOW="\[$(tput setaf 3)\]"
  local -r FG_BLUE="\[$(tput setaf 4)\]" # looks too much like cyan
  local -r FG_MAGENTA="\[$(tput setaf 5)\]"
  local -r FG_CYAN="\[$(tput setaf 6)\]"

  # Put all the git stuff onto PS1
  function __git_info() {
    # check if git is installed
    [ -x "$(which git)" ] || return
    # check if we're in a git repo. (fast)
    git rev-parse --is-inside-work-tree &>/dev/null || return
    # git symbols
    local -r GIT_BRANCH_SYMBOL='⑂ '
    local -r GIT_BRANCH_CHANGED_SYMBOL='+'
    local -r GIT_NEED_PUSH_SYMBOL='▲'
    local -r GIT_NEED_PULL_SYMBOL='▼'

    [ -x "$(which git)" ] || return    # git not found
    # get current branch name or short SHA1 hash for detached head
    local branch="$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --always 2>/dev/null)"
    [ -n "$branch" ] || return  # git branch not found

    local marks

    # branch is modified?
    [ -n "$(git status --porcelain)" ] && marks+=" $GIT_BRANCH_CHANGED_SYMBOL"

    # how many commits local branch is ahead/behind of remote?
    local stat="$(git status --porcelain --branch | grep '^##' | grep -o '\[.\+\]$')"
    local aheadN="$(echo $stat | grep -o 'ahead [[:digit:]]\+' | grep -o '[[:digit:]]\+')"
    local behindN="$(echo $stat | grep -o 'behind [[:digit:]]\+' | grep -o '[[:digit:]]\+')"
    [ -n "$aheadN" ] && marks+=" $GIT_NEED_PUSH_SYMBOL$aheadN"
    [ -n "$behindN" ] && marks+=" $GIT_NEED_PULL_SYMBOL$behindN"

    # print the git branch segment without a trailing newline
    PS1+=" $branch$marks "
  }

  PS1=""
  # ----first line----
  PS1+="\n$RESET"
  # set color, pipe and user
  PS1+="$FG_CYAN┌ \u"
  # set color, [workingdir]
  PS1+="$FG_MAGENTA \w"
  # extra bar
  PS1+="\n$FG_CYAN│ "
  # set color, date and time
  PS1+="$FG_MAGENTA\t \d"
  # git stuff
  __git_info
  # end with newline
  PS1+="\n"
  # ----second line----
  # set color, end of pipe
  PS1+="$FG_CYAN└ "
  # command num
  PS1+="[\#] ";
  # cash prompt
  if [ $EXIT != 0 ]; then
    PS1+="$FG_RED";
  fi
  PS1+="\$ "
  # reset styles
  PS1+="$RESET"
  PS2="⚡ "
}
PROMPT_COMMAND=prompt

# colors
export LS_COLORS="ow=01;36;40"

# added by Anaconda2 4.3.0 installer
export PATH="/home/sina/anaconda2/bin:$PATH"
