#!/usr/bin/bash

##################################################################
#  File        : config.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-10 13:54:15(+0000)
#  Modified    : 2019-05-29 11:50:14(+0800)
#  GitHub      : https://github.com/H-Yin/linux_workspace_setting
#  Description : configuration of all script
#################################################################


APPS="vim git ctags tree lrzsz wget "
CODE_APPS='gcc gcc-c++ '
NET_APPS='nload '
FILE_APPS='zip unzip rar unrar bzip2 7za '
MISC_APPS=' graphviz '

APPS+=$CODE_APPS
APPS+=$NET_APPS
APPS+=$FILE_APPS
APPS+=$MISC_APPS

# app 
RAR_URL='https://www.rarlab.com/rar/rarlinux-5.6.1.tar.gz'
RAR_X64_URL='https://www.rarlab.com/rar/rarlinux-x64-5.6.1.tar.gz'

P7ZIP_URL='https://jaist.dl.sourceforge.net/project/p7zip/p7zip/16.02/p7zip_16.02_src_all.tar.bz2'
# Java
JAVA_URL='https://download.oracle.com/otn-pub/java/jdk/12.0.1+12/69cfe15208a647278a19ef0990eea691/jdk-12.0.1_linux-x64_bin.rpm'
JAVA_MD5='d34a2a729453999e64bc8d096ce534f51941eb9cb02076ef76fe9272c4e2209e'
# Anaconda3
ANACONDA_URL='https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh'
ANACONDA_MD5='4321e9389b648b5a02824d4473cfdb5f'
