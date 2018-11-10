#!/usr/bin/bash

##################################################################
#  File        : start_git.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-02 08:52:11(+0000)
#  Modified    : 2018-11-10 18:12:49(+0000)
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
    if [[ $? -ne 0 ]]; then echo "ERROR : Unable to install Git."; exit 127; fi
else
    echo -e "\033[1mGit\033[0m has been installed."
    exit 0
fi

if [[ -f /etc/bash_completion.d/git ]]; then
    echo "Add git-completion ..."
cat >> ~/.bashrc <<"EOF"
if [[ -f /etc/bash_completion.d/git ]]; then
    source /etc/bash_completion.d/git
fi
EOF
#TODO: source dosen't work
    source ~/.bashrc
fi

echo "Step-2 : Config git options..."
git config --global user.name "H.Yin"
git config --global user.email "csustyinhao@gmail.com"
git config --global color.advice always
git config --global color.diff always
git config --global color.status always
git config --global color.branch always
git config --global color.showBranch always

echo ""
git config -l

