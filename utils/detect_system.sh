#!/usr/bin/bash

##################################################################
#  File        : detect_system.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-10 11:04:42(+0000)
#  Modified    : 2018-11-10 14:54:11(+0000)
#  GitHub      : https://github.com/H-Yin/linux_workspace_setting
#  Description : get some parameters from system
#################################################################


function get_arch()
{
    local bit=`(getconf LONG_BIT || (arch || uname -m) | cut -d_ -f2) 2>/dev/null`
    echo $bit
    return `[[ -n $bit ]]; echo $?`
}

function get_pm()
{
    local pm=''
    [[ -z $pm ]] && yum --version >/dev/null 2>&1 && pm='yum'
    [[ -z $pm ]] && apt --version >/dev/null 2>&1 && pm='apt'
    [[ -z $pm ]] && apt --version >/dev/null 2>&1 && pm='dnf'
    echo $pm
    return `[[ -n $pm ]]; echo $?`
}
