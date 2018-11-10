#!/usr/bin/bash

##################################################################
#  File        : config.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-10 13:54:15(+0000)
#  Modified    : 2018-11-10 21:58:30(+0000)
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
JAVA_URL='http://download.oracle.com/otn-pub/java/jdk/8u192-b12/750e1c8617c5452694857ad95c3ee230/jdk-8u192-linux-x64.rpm'
JAVA_MD5='b7811c8f43b2d1e392e113136f22953f'
# Anaconda3
ANACONDA_URL='https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh'
ANACONDA_MD5='4321e9389b648b5a02824d4473cfdb5f'
