#!/usr/bin/env bash

##################################################################
#  File        : start_vim.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-02 09:02:08(+0000)
#  Modified    : 2019-10-16 17:20:44(+0800)
#  GitHub      : https://github.com/H-Yin/linux_workspace_setting
#  Description : install and config VIM
#################################################################

BASEDIR=$(cd `dirname $0`; pwd)
. $BASEDIR/utils/detect_system.sh

DEPS="vim git ctags"

BASEDIR=$(cd `dirname $0`; pwd)

# set -eu
while :
do
    read -r -p "Do you want to clear the old workspace? [y/N] " input
    mv ~/.vimrc ~/.vimrc.bak
    case $input in
        [yY][eE][sS]|[yY])
            echo "Step-0: Remove bundle and backup .vimrc ..."
            rm -rf ~/.vim/bundle
            ;&
        [nN][oO]|[nN])
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
# install dependences
PM=$( get_pm )
for d in $DEPS; do
    $d --version >/dev/null 2>&1
    if [[ $? -ne 0 ]]; then
        sudo $PM install -y $d >/dev/null 2>&1
        if [[ $? -ne 0 ]]; then echo "Check $d : no";continue; fi
    fi
    echo "Check $d : yes"
done

echo 'Step-3: Clone and install Vundle ...'
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim >/dev/null 2>&1

mkdir ~/.virm/neobundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/neobundle/neobundle.vim


echo 'Step-4: Install all plug-ins ...'
vim +PluginInstall +NeoBundleInstall +qall

# mv sqlutil / taglist to workspace
cp -ri $BASEDIR/vim $HOME/.vim

echo 'All steps are done!'
