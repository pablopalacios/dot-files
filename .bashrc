#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias pacman='sudo pacman'
alias cl='rm *~ .*~ 2> /dev/null'

alias cdp='cd ~/projects/'

alias cda='cd ~/projects/artisan'
alias ye='cda && docker-compose exec editor yarn'
alias ys='cda && docker-compose exec zipper yarn'
alias ywe='ye workspace @editor/editor'
alias ywz='ys workspace @editor/zipper'

PS1='[\u@\h \W]\$ '
