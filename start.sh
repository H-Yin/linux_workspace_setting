#!/bin/bash

##################################################################
#  File        : start.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-10-31 09:47:31(+0000)
#  Modified    : 2018-10-31 09:48:12(+0000)
#  GitHub      : https://github.com/H-Yin/linux_workspace_setting
#  Description : 
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
echo 'Step-2: Clone and install Vundle ...'
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim >/dev/null 2>&1
echo 'Step-3: Install all plug-ins ...'
vim +PluginInstall +qall
echo 'All steps are done!'
