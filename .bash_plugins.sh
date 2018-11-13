#!/usr/bin/bash

##################################################################
#  File        : .bash_plugins.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-11 13:37:38(+0800)
#  Modified    : 2018-11-13 17:47:39(+0000)
#  GitHub      : https://github.com/H-Yin/linux_workspace_setting
#  Description : 
#################################################################


TRASHDIR=$HOME/.trash



function more_ls()
{
    if [[ "$*" =~ "-l" ]];then
        if [[ "$*" =~ "-h" ]];then

        fi
    fi
}

function more_rm()
{
    local day=$(date -d now +%Y-%m-%d)
    local des_dir=$TRASHDIR/$day
    local src_dir=''
    local args="$*"
    if [[ ! -d "$des_dir" ]]; then mkdir -p $des_dir; fi

    if [[ "$args" =~ "--" ]]; then
        src__dir="${args##*--}"
    else
        if [[ "${@:$#}" == "-*" ]]; then
            src_dir=$(pwd)
        else
            src_dir=${@:$#}
        fi
    fi
        #if [[ ! -d "$src_dir" ]]; then
        #    echo "ls: cannot access '$src_dir': No such file or directory"
        #    exit 2
        #fi

    # process parameters
    for arg in $args; do
        case $arg in
                --)
                    src=
                *)
                    ;;
            esac
        done
    fi
}

function dezip()
{
    if [[ $# -lt 1 ]];then
        echo "Usage : dezip <zip_file>."
        return 1
    fi

    local filename="$1"
    local dir=${filename%%.*}
    if [[ ! -d $dir ]]; then mkdir -p $dir; fi

    local ext=''
    if [[ "$1" =~ ".tar." ]]; then
        ext=$(echo $1 | awk -F. '{N1=NF-1; print $N1"."$NF}')
    else
        ext="${1##*.}"
    fi
    # dezip 
    local ret="1"
    case $ext in
        tar)
            tar -xvf $1 && ret=0
            ;;
        tar.gz|tar.bz2|tar.xz|tar.zip|tar.Z)
            tar -axvf $1 && ret=0
            ;;
        gz)
            gzip -t $1 && gzip -dv1 $1 && ret=0
            ;;
        bz2)
            bzip2 -t $1 && bzip2 -dvk1 $1 && ret=0
            ;;
        xz)
            xz -t $1 && xz -dvk $1 && ret=0
            ;;
        zip)
            unzip -t $1 && unzip $1 -d $dir && ret=0
            ;;
        rar)
            unrar t $1 && unrar x -v $1 $dir && ret=0
            ;;
    esac
    return $ret
}

function dogit()
{
    git status
    if [[ $? -ne 0 ]]; then
        return 1
    fi

    if [[ $(git status | grep '^no' | awk '{print $1}') != "nothing" ]]; then
        local comment=''
        read -p "Enter your comment: " comment
        git add -A && git commit -am "$comment"
        git pull origin master
        git push origin master
    else
        git pull origin master
    fi
}
    
