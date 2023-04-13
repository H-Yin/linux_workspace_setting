#!/usr/bin/env bash

##################################################################
#  File        : start_jupyter.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-04 10:16:21(+0000)
#  Modified    : 2023-04-13 15:29:35(+0800)
#  GitHub      : https://github.com/H-Yin/linux_workspace_setting
#  Description : install Anaconda and Jupyter
#################################################################


BASEDIR=$(cd `dirname $0`; pwd)
. $BASEDIR/config/config.sh

ANACONDA_FILE=`echo $ANACONDA_URL | awk -F/ '{print $NF}'`


conda --version >/dev/null 2>&1
exitcode=$?
if [[ $exitcode -ne 0 ]];then
    echo "Step-1: Download Anaconda installer ..."
    if [[ ! -f $ANACONDA_FILE ]]; then
        wget -nc $ANACONDA_URL
    fi
    exitcode=$?
    if [[ $exitcode -ne 0 ]]; then
        echo "ERROR : download Anaconda installer failed."
        exit $exitcode
    fi

    echo "Step-2: Verify the data integrity of the Anaconda installer ..."
    LOCAL_SUM=`md5sum $ANACONDA_FILE | awk '{print $1}'`
    if [[ "$ANACONDA_MD5" != "$LOCAL_SUM" ]]; then
        echo "ERROR : Anaconda installer file was broken."
        exit 127
    fi

    echo "Step-3: Install Anaconda ..."
    rm -rf $HOME/anaconda3
    bash $ANACONDA_FILE -b -p $HOME/anaconda3 -f
    exitcode=$?
    if [[ $exitcode -ne  0 ]]; then
        echo "ERROR : install anaconda dailed."
        exit $exitcode
    fi

    echo "Step-4: Add Anaconda to PATH ..."
    echo 'export PATH="$HOME/anaconda3/bin:$PATH"'  >> $HOME/.bashrc
    source $HOME/.bashrc

    conda --version >/dev/null 2>&1
    exitcode=$?
    if [[ $exitcode -ne 0 ]];then
        echo "ERROR : Anaconda3 can't run properly."
        exit $exitcode
    else
        echo "Install Anaconda3 successfully. "
    fi
else
    echo "Anaconda3 has been installed. "
fi




#echo "Step-5: Config and run jupyter ..."
#jupyter notebook --generate-config
#cp -rf $BASEDIR/.jupyter/* $HOME/.jupyter
# TODO auto-do
#jupyter notebook password

#mkdir ~/jupyter
#nohup jupyter notebook >~/jupyter/jupyter.log 2>&1 &

echo "Step-6: Config python's enviorment"
cp -f python/tab.py $HOME/.tab.py
echo 'export PYTHONSTARTUP="$HOME/.tab.py"' >> $HOME/.bashrc
source $HOME/.bashrc


