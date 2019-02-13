alias gs='git status -s'
alias grep='grep --color'
alias mv='mv -v -i'
alias rm='rm -v'
alias cp='cp -v -i'
alias gist='gist -pcso'
alias dc='docker-compose'

mcd() {
    mkdir "${1}" && cd "${1}"
}
