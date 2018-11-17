#!/usr/bin/bash

##################################################################
#  File        : .bash_plugins.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-11 13:37:38(+0800)
#  Modified    : 2018-11-17 19:49:28(+0800)
#  GitHub      : https://github.com/H-Yin/linux_workspace_setting
#  Description : 
#################################################################


TRASHDIR=$HOME/.trash
TRASHHIS=$TRASHDIR/.trash_history

function more_ls()
{
    if [[ "$*" =~ "-l" ]];then
        if [[ "$*" =~ "-h" ]];then
            echo ''
        fi
    fi
}

#------------------------------- build trash system----------------
function undo()
{
    local num=1
    if [[ -n $1 && $1 -gt 0 ]]; then num=$1; fi
    local line=$(tail -$num $TRASHHIS | head -1)
    if [[ -z $line ]];then
        echo "No Undo operation can be performed."
        exit 1
    fi
    local args=($line)
    local src_dir=${args[0]}
    local dst_dir=${args[@]:1}
    for d in $dst_dir; do
        mv $TRASHDIR/$src_dir/${d##*/} $(dirname $d)
    done
}

function more_rm()
{
    local daydir=$(date -d now +%Y-%m-%d/%H%M%S%N)
    local des_dir=$TRASHDIR/$daydir
    local src_dir=""
    local args="$*"
    # create new dir and file
    if [[ ! -d "$des_dir" ]]; then
        mkdir -p $des_dir
    fi
    if [[ ! -f $TRASHHIS ]]; then
        touch $TRASHHIS
    fi
    # get src dir
    if [[ "$args" =~ "--" ]]; then
        src_dir=("${args##*--}")
    else
        if [[ "${@:$#}" == "-*" ]]; then
            src_dir=$(ls)
        else
            src_dir=$args
        fi
    fi

    # prepare to record history
    local temp_dir=''
    for src in $src_dir; do
        temp_dir+=$(readlink -f $src)' '
    done
    mv $temp_dir $des_dir
    echo "$daydir $temp_dir" >> $TRASHHIS
}
# empty the trash bin
function empty()
{
    if [[ -n "$(alias | grep more_rm)" ]]; then
        unalias rm
    fi
    if [[ -n "$1" ]]; then
        # delete data n days ago
        local day=$(date -d "now -$1 day" +%Y-%m-%d)
        local dir_s=$(ls $TRASHDIR)
        for d in $dir_s; do
            if [[ $d < $day || $d = $day ]]; then
                $(which rm) -rf $TRASHDIR/$d
            fi
        done
        # update .trash_history
        local tempfile=".trash_history.temp"
        cat $TRASHHIS | awk -v d="$day" -F/ '$1>d{print $0}' > $tempfile
        mv $tempfile $TRASHHIS
    else

        # delete all data
        $(which rm) -rf $TRASHDIR/*
    fi
    alias rm='more_rm'
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
    # get extension of file
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
    
    local comment=''
    local lang=$LANG
    export LANG=en_GB

    if [[ $(git status | grep '^no' | awk '{print $1}') != "nothing" ]]; then
        read -p "Enter your comment: " comment
        git add -A && git commit -am "$comment"
        git pull origin master
        git push origin master
    else
        git pull origin master
    fi
    export LANG=$lang
}
 
