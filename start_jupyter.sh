#!/usr/bin/bash

##################################################################
#  File        : start_jupyter.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-04 10:16:21(+0000)
#  Modified    : 2018-11-06 02:35:47(+0000)
#  GitHub      : https://github.com/H-Yin/linux_workspace_setting
#  Description : 
#################################################################


# TODO : complete
cp -rf .jupyter ~/
nohup jupyter notebook >~/jupyter.log 2>&1 &
