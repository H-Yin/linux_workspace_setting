#!/usr/bin/bash

##################################################################
#  File        : start_app.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-02 10:28:11(+0000)
#  Modified    : 2018-11-06 23:44:36(+0800)
#  GitHub      : https://github.com/H-Yin/linux_workspace_setting
#  Description : install some useful app
#################################################################


# get RMP cmd
RMP=''
yum --version >/dev/null 2>&1
if [[ $? -eq 0 ]]; then 
    RMP='yum'
else
    apt --version >/dev/null 2>&1
    if [[ $? -eq 0 ]]; then
        RMP='apt'
    else
        echo 'ERROR: No available package management software.'
        exit 127
    fi
fi
# install dependences by checking version
APPS="vim git ctags tree lrzsz wget"
NET_APPS='nload '
APPS+=NET_APPS

for app in $APPS; do
    $app --version >/dev/null 2>&1
    if [[ $? -ne 0 ]]; then
        sudo $RMP install -y $app >/dev/null 2>&1
        if [[ $? -ne 0 ]]; then 
            echo "Check $app : no";continue; 
        fi
    fi
    echo "Check $app : yes"
done

#---------------------------------------------------------------
# 'bzip2 --verison >/dev/null 2>&1' command won't exit
# 
