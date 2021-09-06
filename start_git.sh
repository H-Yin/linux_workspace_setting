#!/usr/bin/env bash

##################################################################
#  File        : start_git.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-02 08:52:11(+0000)
#  Modified    : 2021-09-06 14:08:39(+0800)
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
#git config --global user.name "yinhao"
#git config --global user.email "csustyinhao@gmail.com"
git config --global color.advice always
git config --global color.diff always
git config --global color.status always
git config --global color.branch always
git config --global color.showBranch always
git config --global core.editer vim
git config --global credential.helper 'cache --timeout 360000'

## alias
git config --global alias.lg "log --pretty=format:'%C(yellow)%h %C(green)%><(20)%cn %C(blue)%><(25)[%cd] %C(reset)%m %s %C(red)%d' --date=local"

git config -l

echo "Step-3 : Set git completion / prompt ..."
version="v$(git --version | awk '{print $3}')"
wget https://raw.githubusercontent.com/git/git/$version/contrib/completion/git-completion.bash
wget https://raw.githubusercontent.com/git/git/$version/contrib/completion/git-prompt.sh

if [ -f git-completion.bash ]; then
    cp git-completion.bash ~/.git-completion.bash
else
    cp git/git-completion.bash ~/.git-completion.bash
fi

if [ -f git-prompt.sh ]; then
    cp git-prompt.sh ~/.git-prompt.sh
else
    cp git/git-prompt.sh ~/.git-prompt.sh
fi

