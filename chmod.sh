#!/usr/bin/bash

##################################################################
#  File        : chmod.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-01 11:34:39(+0800)
#  Modified    : 2018-11-02 10:36:10(+0000)
#  GitHub      : https://github.com/H-Yin/
#  Description : chmod for all script
#################################################################

files=`ls ./`
for file in $files; do
    if [[ "$file" =~ \.sh && ! -x "$file" ]]; then
        echo $file
        chmod a+x $file
    fi
done
