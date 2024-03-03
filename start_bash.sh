#!/usr/bin/env bash

##################################################################
#  File        : start_bash.sh
#  Author      : H.Yin
#  Email       : csustyinhao@gmail.com
#  Created     : 2018-11-02 11:01:42(+0000)
#  Modified    : 2023-04-13 16:48:18(+0800)
#  GitHub      : https://github.com/H-Yin/linux_workspace_setting
#  Description : add aliases or some settings for bash
#################################################################

BASEDIR=$(cd `dirname $0`; pwd)
cp -rf $BASEDIR/.bash_plugins.sh $HOME/
if [ -f $HOME/.bash_plugins.sh ]; then

# backup
cp $HOME/.bashrc $HOME/.bashrc.bak@$(date +%Y%m%d)
# filter
OLD=$(awk '{if($0 ~ /#yinhao.*start.*$/){start=1}; if($0 ~ /#yinhao.*end.*$/){end=1}; if ( start !=1 && end != 1){print $0}}' $HOME/.bashrc)
# remove old config in ~/.bashrc
if [ ! -z "$OLD" ]; then
    echo "$OLD"> $HOME/.bashrc
fi

cat >> $HOME/.bashrc <<"EOF"
#yinhao =================== start ================

if [ -f $HOME/.bash_plugins.sh ]; then
    source $HOME/.bash_plugins.sh
fi

# alias rm='more_rm'

alias ..='cd ..'
alias ...='cd ../..'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# grep pattern path
# alias grep='test(){ grep --color=always -nrITE $1; }; test'

alias ls='ls --color=auto --hide="__*" -lh --time-style="+[%Y-%m-%d %H:%M:%S]"'
alias bc='bc -l'
alias mkdir='mkdir -pv'

alias hc='history -c'
alias hl='history 20'

alias ping='ping -c 4'
alias fastping='ping -c 10 -s.2'

alias df='df -HT'
alias du='du -ch'

# Command history 
HISTFILE=~/.bash_history_$(date -d "now" +"%Y%m%d")
if [ ! -f $HISTFILE ]; then
    touch $HISTFILE
fi

export HISTSIZE=100
export HISTCONTROL="ignoreboth:erasedups"
export HISTIGNORE="clear:history*:" # ignore these commands
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S  "  # space in time and cmd
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

shopt -s histverify 
shopt -s histappend

export EDITOR=vim

# git completion
if [[ -f /etc/bash_completion.d/git ]]; then
    source /etc/bash_completion.d/git
elif [[ -f ~/.git-completion.bash ]]; then
    source ~/.git-completion.bash
else
    echo "Warning. 'git-commletion.bash' is missing."
fi

# git prompt
if [[ -f ~/.git-prompt.sh ]]; then
    source ~/.git-prompt.sh
    # 显示文件状态
    # *  : 表示有文件未放入暂存区(unstaged files)
    # +  : 表示暂存区有文件(staged files)未提交至版本库
    export GIT_PS1_SHOWDIRTYSTATE=true
    # 显示颜色
    export GIT_PS1_SHOWCOLORHINTS=true
    # 用 % 表示有文件加入到 index 中
    export GIT_PS1_SHOWUNTRACKEDFILES=true
    # 显示当前分支与远程分支是否存在差异
    # <  : 表示当前节点落后远程分支
    # >  : 表示远程分支节点落后当前分支
    # =  : 表示当前分支和远程分支是统一分支且节点一致
    # <> : 表示当前分支与远程分支不是同一分支
    export GIT_PS1_SHOWUPSTREAM="auto"
    
    export PS1='\[\e[1;31m\][\t] \[\e[1;32m\]\u\[\e[1;33m\]@\[\e[1;34m\]$(hostname -I | cut -d" " -f 1) \[\e[1;35m\]\W \[\e[1;36m\]$(__git_ps1 "(%s)") \[\e[1;33m\]<$(tty | sed -e "s/\///g"):\!>\[\e[0;31m\]☭\[\e[00m\] '
else
    export PS1='\e[1;32m\][\t] \[\e[1;35m\]\u\[\e[1;33m\]@\[\e[1;34m\]\h \[\e[1;31m\]\W \[\e[0;36m\]☭\[\e[00m\] '
fi


#yinhao =================== end ================
history -c

EOF

which conda && conda -V
if [[ $? == 0 ]]; then
    CONDA_HOME=$(conda info | grep 'active env location' | tr -d ' ' | cut -d : -f 2)
    OLD=$(awk 'BEGIN{start=0;end=0;}{if($0 ~ /^# >>> conda initialize >>>$/ && start == 0){start=1}; if(start == end){print $0} if($0 ~ /^# >>> conda initialize >>>$/ && end == 0){end=1;};}' $HOME/.bashrc)
    # remove old config in ~/.bashrc
    if [ ! -z "$OLD" ]; then
        echo "$OLD"> $HOME/.bashrc
    fi
fi


fi
