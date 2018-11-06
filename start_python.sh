#!/usr/bin/bash

##################################################################
#  File        : start_jupyter.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-04 10:16:21(+0000)
#  Modified    : 2018-11-06 15:14:53(+0000)
#  GitHub      : https://github.com/H-Yin/linux_workspace_setting
#  Description : install Anaconda and Jupyter
#################################################################


ANACONDA_URL='https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh'
ANACONDA_FILE=`echo $ANACONDA_URL | awk -F/ '{print $NF}'`
ANACONDA_SUM='4321e9389b648b5a02824d4473cfdb5f'

echo "Step-1: Download Anaconda installer ..."
wget --progress=bar $ANACONDA_URL
exitcode=$?
if [[ $exitcode -ne 0 ]]; then
    echo "ERROR : download Anaconda installer failed."
    exit $exitcode
fi

echo "Step-2:  Verify the data integrity of the Anaconda installer ..."
LOCAL_SUM=`md5sum $ANACONDA_FILE | awk '{print $1}'`
if [[ "$ANACONDA_SUM" != "$LOCAL_SUM" ]]; then
    echo "ERROR : Anaconda installer file was broken."
    exit 127
fi

echo "Step-3: Install Anaconda ..."
rm -rf $HOME/anaconda3
bash ~/$ANACONDA_FILE -b -p -f $HOME/anaconda3
exitcode=$?
if [[ $exitcode -ne  0 ]]; then
    echo "ERROR : install anaconda dailed."
    exit $exitcode
fi

echo "Step-4: Add Anaconda to PATH ..."
cat >> $HOME/.bashrc <<EOF
export PATH="$HOME/miniconda/bin:$PATH"
EOF
source $HOME/.bashrc

conda --version >/dev/null 2>&1
exitcode=$?
if [[ $exitcode -ne 0 ]];then
    echo "ERROR : Anaconda3 can't run properly."
else
    echo "Install Anaconda3 successfully. "
fi

echo "Step-5: Config and run jupyter ..."

# cp -rf .jupyter ~/
# nohup jupyter notebook >~/jupyter.log 2>&1 &
