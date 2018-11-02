#!/usr/bin/bash

##################################################################
#  File        : start_git.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-02 08:52:11(+0000)
#  Modified    : 2018-11-02 09:10:54(+0000)
#  GitHub      : https://github.com/H-Yin/linux_workspace_setting
#  Description : install and Config GIT
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
# install dependences

git --version >/dev/null 2>&1
if [[ $? -ne 0 ]]; then
    sudo $RMP install -y git >/dev/null 2>&1
    if [[ $? -ne 0 ]]; then echo "ERROR : Unable to install Git."; exit 127; fi
fi

git config --global user.name "H.Yin"
git config --global user.email "csustyinhao@gmail.com"
git config --global color.advice always
git config --global color.diff always
git config --global color.status always
git config --global color.branch always
git config --global color.showBranch always

git config -l
