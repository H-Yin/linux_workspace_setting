#!/usr/bin/bash

##################################################################
#  File        : start_vim.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-02 09:02:08(+0000)
#  Modified    : 2018-11-02 10:35:42(+0000)
#  GitHub      : https://github.com/H-Yin/linux_workspace_setting
#  Description : install and config VIM
#################################################################


# set -eu
while :
do
    read -r -p "Do you want to clear the old workspace? [y/N] " input
    case $input in
        [yY][eE][sS]|[yY])
            echo "Step-0: Remove bundle and backup .vimrc ..."
            rm -rf ~/.vim/bundle
            ;&
        [nN][oO]|[nN])
            mv ~/.vimrc ~/.vimrc.bak
            break
            ;;
        *)
            echo "Invalid input, please try again ..."
            ;;
    esac
done

echo 'Step-1: Copy .vimrc to home directory ...'
cp .vimrc ~/

echo 'Step-2: Check and install dependences ...'
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
DEPS="vim git ctags"
for d in $DEPS; do
    $d --version >/dev/null 2>&1
    if [[ $? -ne 0 ]]; then
        sudo $RMP install -y $d >/dev/null 2>&1
        if [[ $? -ne 0 ]]; then echo "Check $d : no";continue; fi
    fi
    echo "Check $d : yes"
done

echo 'Step-3: Clone and install Vundle ...'
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim >/dev/null 2>&1

echo 'Step-4: Install all plug-ins ...'
vim +PluginInstall +qall

echo 'All steps are done!'
