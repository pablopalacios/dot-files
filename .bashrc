#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


export GOPATH=$HOME/go

PATH=$PATH:$GOPATH/bin:~/.local/bin

alias ls='ls --color=auto'
alias sc='echo -e "\e[?25h"'
alias hc='echo -e "\e[?25l"'
alias pacman='sudo pacman'
alias cl='rm *~'

alias uhutils='cd ~/projects/easyfota_utils/src && . ../venv/bin/activate'
alias uhauth='cd ~/projects/easyfota_auth/src && . ../venv/bin/activate'
alias uhmetadata='cd ~/projects/easyfota_schema/src && . ../venv/bin/activate'
alias uhui='cd ~/projects/updatehub_ui/ui'
alias mock='cd ~/projects/easyfota_mock/src && . ../venv/bin/activate && ./app.py'



alias tb="nc termbin.com 9999 | "

# pyenv
eval "$(pyenv init -)"
