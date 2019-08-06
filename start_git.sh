#!/usr/bin/env bash

##################################################################
#  File        : start_git.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-02 08:52:11(+0000)
#  Modified    : 2019-08-06 15:06:56(+0800)
#  GitHub      : https://github.com/H-Yin/linux_workspace_setting
#  Description : install and Config GIT
#################################################################

BASEDIR=$(cd `dirname $0`; pwd)
. $BASEDIR/utils/detect_system.sh


PM=$(get_pm)
echo "Step-1 : Check and install git ..."
git --version >/dev/null 2>&1
if [[ $? -ne 0 ]]; then
    sudo $PM install -y git >/dev/null 2>&1
    if [[ $? -ne 0 ]]; then
        echo "ERROR : Unable to install Git."; 
        exit 127; 
    fi
else
    echo -e "\033[1mGit\033[0m has been installed."
fi

echo "Step-2 : Config git options..."
git config --global user.name "yinhao"
git config --global user.email "csustyinhao@gmail.com"
git config --global color.advice always
git config --global color.diff always
git config --global color.status always
git config --global color.branch always
git config --global color.showBranch always
git config --global core.editer vim
git config --global credential.helper 'cache --timeout 360000'

git config -l
