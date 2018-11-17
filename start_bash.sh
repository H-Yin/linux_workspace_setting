#!/bin/bash

##################################################################
#  File        : start_bash.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-02 11:01:42(+0000)
#  Modified    : 2018-11-17 19:52:28(+0800)
#  GitHub      : https://github.com/H-Yin/
#  Description : 
#################################################################



BASEDIR=$(cd `dirname $0`; pwd)
cp -rf $BASEDIR/.bash_plugins.sh $HOME/
if [[ -f $HOME/.bash_plugins.sh ]]; then
cat >> $HOME/.bashrc <<"EOF"

if [[ -f $HOME/.bash_plugins.sh ]]; then
    source $HOME/.bash_plugins.sh
fi

alias rm='more_rm'

alias ..='cd ..'
alias ...='cd ../..'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# grep pattern path
alias grep='test(){ grep --color=always -nrITE $1; }; test'
alias lsl='ls -lh'
# Command history 
set -o "history"
HISTSIZE=1000
HISTCONTROL="ignoreboth:erasedups"
HISTIGNORE="clear"
HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S  " # space in time and cmd
export HISTSIZE HISTCONTROL HISTIGNORE HISTTIMEFORMAT

alias bc='bc -l'
alias mkdir='mkdir -pv'

alias ping='ping -c 4'
alias fastping='ping -c 10 -s.2'

alias df='df -HT'
alias du='du -ch'

export EDITOR=vim

EOF

fi
