#!/bin/bash

##################################################################
#  File        : start_bash.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-02 11:01:42(+0000)
#  Modified    : 2018-11-14 22:57:24(+0800)
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

EOF

fi
