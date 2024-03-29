#!/usr/bin/bash

##################################################################
#  File        : config.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-10 13:54:15(+0000)
#  Modified    : 2019-08-01 13:56:33(+0800)
#  GitHub      : https://github.com/H-Yin/linux_workspace_setting
#  Description : configuration of all script
#################################################################


CODE_APPS='git cmake '
NET_APPS='nload nethogs '
FILE_APPS='zip unzip rar unrar bzip2 7za '
SYS_APPS=' htop ntop '
MISC_APPS='  graphviz tree lrzsz wget '

APPS=$CODE_APPS
APPS+=$NET_APPS
APPS+=$FILE_APPS
APPS+=$SYS_APPS
APPS+=$MISC_APPS

# app 
RAR_URL='https://www.rarlab.com/rar/rarlinux-5.6.1.tar.gz'
RAR_X64_URL='https://www.rarlab.com/rar/rarlinux-x64-5.6.1.tar.gz'

P7ZIP_URL='https://jaist.dl.sourceforge.net/project/p7zip/p7zip/16.02/p7zip_16.02_src_all.tar.bz2'
# Java
JAVA_URL='https://download.oracle.com/otn-pub/java/jdk/12.0.1+12/69cfe15208a647278a19ef0990eea691/jdk-12.0.1_linux-x64_bin.rpm'
JAVA_MD5='d34a2a729453999e64bc8d096ce534f51941eb9cb02076ef76fe9272c4e2209e'
# Anaconda3
ANACONDA_URL='https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh'
ANACONDA_MD5='ec6a6bf96d75274c2176223e8584d2da'
