#!/usr/bin/env bash

##################################################################
#  File        : start_vim.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-02 09:02:08(+0000)
#  Modified    : 2023-04-13 16:47:35(+0800)
#  GitHub      : https://github.com/H-Yin/linux_workspace_setting
#  Description : install and config VIM
#################################################################

BASEDIR=$(cd `dirname $0`; pwd)
. $BASEDIR/utils/detect_system.sh

DEPS="vim git ctags"

BASEDIR=$(cd `dirname $0`; pwd)

# set -eu
echo 'Step-1: Copy .vimrc to home directory ...'
mv ~/.vimrc ~/.vimrc.bak
rm -rf ~/.vim.bak && mv ~/.vim ~/.vim.bak
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

# install nodejs/yarn for coc
# -- Ubuntu
if [[ $(head -n1 /etc/issue) == Ubuntu* ]]; then
	# remove old nodejs
	sudo apt purge -y nodejs
	sudo rm -rf /etc/apt/sources.list.d/nodesource.list /etc/apt/keyrings/nodesource.gpg
	# install LTS nodejs
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && sudo apt install -y nodejs
    which yarn || sudo npm install -g yarn
else
	echo "Unable to install nodejs"
fi

echo 'Step-3: Clone and install Vim-Plug ...'

curl -fsSLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [ $? != 0 ]; then
	cp -f vim/plug.vim ~/.vim/autoload/plug.vim
fi

echo 'Step-4: Install all plug-ins ...'
vim +PlugInstall +qall

cp -ri $BASEDIR/vim $HOME/.vim

echo 'All steps are done!'
