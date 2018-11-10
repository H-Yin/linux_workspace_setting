#!/bin/bash

##################################################################
#  File        : start_app.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-02 10:28:11(+0000)
#  Modified    : 2018-11-10 22:13:41(+0000)
#  GitHub      : https://github.com/H-Yin/linux_workspace_setting
#  Description : install some useful app
#################################################################


BASEDIR=$(cd `dirname $0`; pwd)
. $BASEDIR/utils/detect_system.sh
. $BASEDIR/config/config.sh


BIT=$(get_arch)
PM=$(get_pm)

function check()
{
    local flag=''
    case $1 in
        lrzsz) 
            flag=`(sz --version && rz --version) > /dev/null 2>&1; echo $?`
            ;;
        graphviz)
            flag=`graphml2gv -? > /dev/null 2>&1; echo $?`
            ;;
        gcc-c++)
            flag=`g++ --help >/dev/null 2>&1; echo $?`
            ;;
        *)
            # '$bzip2 / nload --verison' command won't exit.
            flag=`($1 --help || timeout 2 $1 --version || timeout 2 $1) >/dev/null 2>&1; echo $?`
            ;;
    esac
    echo $flag
    return $([[ -n $flag ]]; echo $?)
}

function install_rar()
{
    local output='rarlinux.tar.gz'
    if [[ "$BIT" == "64" ]]; then
        wget $RAR_X64_URL -O $output
    else
        wget $RAR_URL -O $output
    fi
    tar -zxvf $output >/dev/null 2>&1 && cd rar
    sudo make
    cd ..
    rm -rf rar $output
}

# p7Zip
function install_7za()
{
    local output='p7Zip.tar.bz2'
    wget $P7ZIP_URL -O $output
    tar -jxf $output >/dev/null 2>&1 && cd p7Zip
    sudo make && sudo make install
    cd ..
    rm -rf p7zip $output
}


for app in $APPS; do
    if [[ $(check $app) -ne 0 ]]; then
        echo -e "\tInstall \033[1m$app\033[0m ..."
        sudo $PM install -y $app >/dev/null 2>&1
        # install by UDF
        if [[ $? -ne 0 ]]; then
            echo -e "\tError : No package \033[1m$app\033[0m available."
            func=install_$app
            if [[ $(type -t $func) == "function" ]];then
                $func
            else
                echo -e "\tError : No UDF available for \033[1m$app\033[0m"
            fi
        fi
        # check again
        if [[ $(check $app) -eq 0 ]]; then
            echo -e "\tInstall \033[1m$app\033[0m successfully."
        else
            echo -e "\tInstall \033[1m$app\033[0m failed."
        fi
    else
        echo -e "\033[1m$app\033[0m has been installed."
    fi
done
