#!/usr/bin/bash

##################################################################
#  File        : start_jdk.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-02 11:50:25(+0000)
#  Modified    : 2019-05-29 11:58:11(+0800)
#  GitHub      : https://github.com/H-Yin/
#  Description : install jdk and config JAVA environment variable
#################################################################

BASEDIR=$(cd `dirname $0`; pwd)
. $BASEDIR/config/config.sh

RPM_FILE=$(echo $JAVA_URL | awk -F/ '{print $NF}')
JDK_PATH=$(echo $RPM_FILE | awk -F_ '{print $1}')

PROFILE="/etc/profile"
EXPORT_STR=$(cat <<EOF

JAVA_HOME=/usr/java/$JDK_PATH/
JRE_HOME=/usr/java/$JDK_PATH/jre
CLASS_PATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar:\$JRE_HOME/lib
PATH=\$PATH:\$JAVA_HOME/bin:\$JRE_HOME/bin

EOF
)


java -version >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Download $RPM_FILE ..."
    wget -nc --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" $JAVA_URL  >/dev/null 2>&1
    if [[ $? -ne 0 ]]; then
        echo 'ERROR : Download rpm file failed.'
        exit 127
    fi
    if [[ $JAVA_MD5 != `sha256sum $RPM_FILE | awk '{print $1}'` ]]; then
        echo "ERROR : $RPM_FILE 's digist is wrong."
        exit 126
    fi
    echo "Remove old JAVA and install new JAVA ..."
    sudo rpm -e --nodeps `rpm -qa | grep jdk` >/dev/null 2>&1
    rpm -i --test $RPM_FILE >/dev/null 2>&1
    if [[ $? -ne 0 ]]; then
        echo "ERROR : $RPM_FILE is not an rpm package."
        exit 125
    else
        sudo rpm -ivh $RPM_FILE >/dev/null 2>&1
        if [[ $? -eq 0 ]]; then
            for item in $EXPORT_STR; do
                echo $item | sudo tee -a $PROFILE >/dev/null 2>&1
            done
            echo "export JAVA_HOME JRE_HOME CLASS_PATH PATH" | sudo tee -a $PROFILE >/dev/null 2>&1
            # check
            source $PROFILE
            echo $JAVE_HOME
            echo $CLASSPATH
            rm -r $RPM_FILE
        else
            echo "ERROR : Unzip RPM failed."
            exit 124
        fi
        java -version >/dev/null 2>&1
        if [[ $? -eq 0 ]]; then
            echo "Install JDK successfully."
        else
            echo "ERROR : Install JDK failed."
            exit 123
        fi
    fi
else
    echo 'The JDK already exists.'
    exit 0
fi

