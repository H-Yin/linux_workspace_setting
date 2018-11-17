#!/bin/bash

##################################################################
#  File        : start_bash.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-02 11:01:42(+0000)
#  Modified    : 2018-11-17 05:15:45(+0000)
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

alias bc='bc -l'
alias mkdir = 'mkdir -pv'

alias ping = 'ping -c 4'
alias fastping = 'ping -c 10 -s.2'

alias df = 'df -HT'
alias du = 'du -ch'

export EDITOR=vim

EOF

fi
