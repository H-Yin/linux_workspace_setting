#!/bin/bash

##################################################################
#  File        : start_app.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-02 10:28:11(+0000)
#  Modified    : 2018-11-10 15:40:55(+0000)
#  GitHub      : https://github.com/H-Yin/linux_workspace_setting
#  Description : install some useful app
#################################################################


BASEDIR=`dirname $0`
. $BASEDIR/utils/detect_system.sh
. $BASEDIR/config/config.sh


# install dependences by checking version
APPS="vim git ctags tree lrzsz wget "
NET_APPS='nload '
FILE_APPS='zip unzip rar unrar bzip2 '
APPS+=$NET_APPS
APPS+=$FILE_APPS

BIT=`get_arch`
PM=`get_pm`

function check()
{
    local flag=''
    case $1 in
        lrzsz) 
            flag=`(sz --version && rz --version) > /dev/null 2>&1; echo $?`
            ;;
        *)
            # '$bzip2 / nload --verison' command won't exit.
            flag=`($1 --help || timeout 2 $1 --version || timeout 2 $1) >/dev/null 2>&1; echo $?`
            ;;
    esac
    echo $flag
    return `[[ -n $flag ]]; echo $?`
}

function install_rar()
{
    local output='rarlinux.tar.gz'
    if [[ $BIT == '64' ]]; then
        wget $RAR_X64_URL -O $output
    else
        wget $RAR_URL -O $output
    fi
    tar -zxvf $output >/dev/null 2>&1 && cd rar
    sudo make
    cd ..
    rm -rf rar $output
}

for app in $APPS; do
    if [[ `check $app` -ne 0 ]]; then
        echo "Install $app ..."
        sudo $PM install -y $app #>/dev/null 2>&1
        # install by UDF
        if [[ $? -ne 0 ]]; then
            func=intsall_$app
            if [[ $(type -t $func) == 'function' ]];then
                $func
            fi
        fi
        # check again
        if [[ `check $app` -eq 0 ]]; then
            echo "Install $app successfully."
        else
            echo "Install $app failed."
        fi
    else
        echo "$app has been installed."
    fi
done
