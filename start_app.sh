#!/usr/bin/bash

##################################################################
#  File        : start_app.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-02 10:28:11(+0000)
#  Modified    : 2018-11-10 15:08:46(+0000)
#  GitHub      : https://github.com/H-Yin/linux_workspace_setting
#  Description : install some useful app
#################################################################


BASEDIR=`dirname $0`
. $BASEDIR/utils/detect_system.sh
. $BASEDIR/config/config.sh


# install dependences by checking version
APPS="vim git ctags tree lrzsz wget "
NET_APPS='nload '
FILE_APPS='zip unzip rar bzip2 '
APPS+=NET_APPS


function check()
{
    local flag=''
    case $1 in
        lrzsz) flag=`(sz --version && rz --version) > /dev/null 2>&1; echo $?` ;;
        # 'bzip2 --verison >/dev/null 2>&1' command won't exit
        bzip2) flag=`bzip2 --help > /dev/null 2>&1; echo $?` ;;
        *)     flag=`($1 --version || $1 --help || $1) >/dev/null 2>&1; echo $?`;;
    esac
    echo $flag
    return $flag
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
    rm -rf rar
}

for app in $APPS; do
    if [[ `check $app` -ne 0 ]]; then
        echo "Install $app ..."
        sudo $RMP install -y $app >/dev/null 2>&1
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
    fi
done

