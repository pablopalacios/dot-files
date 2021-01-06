#
# ~/.bashrc
#

# If not running interactively, don't do anything

[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '

. /etc/profile.d/vte.sh

if [ -f /usr/lib/bash-git-prompt/gitprompt.sh ]; then
    GIT_PROMPT_THEME=Default_Arch
    source /usr/lib/bash-git-prompt/gitprompt.sh
fi

alias ls='ls --color=auto'
alias pacman='sudo pacman'
alias cl='rm *~ .*~ 2> /dev/null'

function ghr() {
    BRANCH=$1
    git fetch \
        && git checkout $BRANCH \
        && git reset --hard origin/$BRANCH \
        && git pull --rebase origin master \
        && git push origin $BRANCH --force \
        && git checkout master \
        && git branch -D $BRANCH
}

export PATH=~/bin:$PATH

source /usr/share/nvm/init-nvm.sh
