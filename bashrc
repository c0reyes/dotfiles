#!/usr/bin/env bash

# Config Bash It
export BASH_IT="${HOME}/.bash_it"
export BASH_IT_THEME='powerline-plain'
#export SCM_CHECK=true

# Load Bash It
if [ -f ${BASH_IT}/bash_it.sh ]; then
   source ${BASH_IT}/bash_it.sh
fi

export BROWSER=/usr/bin/chromium
export EDITOR=vim

export JAVA_HOME=/opt/Apps/java
export PATH=${PATH}:${HOME}/bin:/opt/Apps/java/bin:/opt/Apps/sdk/platform-tools:/opt/Apps/maven/bin:/opt/Apps/gradle/bin:/opt/Apps/pandoc-2.9.1.1/bin
export TERM=screen-256color
export GOPATH=${HOME}/go
export MATLAB=/opt/Apps/MATLAB/R2019a/

alias vi=vim
alias ls='ls -N --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias weather="curl https://wttr.in/"
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
alias chivo='cht.sh'
alias cat='ccat -G String="_fuchsia_" -G Plaintext="green"'

if [ -f ${HOME}/.ssh_aliases ]; then
    source ${HOME}/.ssh_aliases
fi

# dircolors -p > ~/.dir_colors
eval `dircolors -b ${HOME}/.dir_colors`

if [ -f ${HOME}/.bash-insulter/src/bash.command-not-found ]; then
    source ${HOME}/.bash-insulter/src/bash.command-not-found
fi

# ssh-agent
if ! pgrep -u "${USER}" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi

if [[ "${SSH_AGENT_PID}" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)" > /dev/null
fi

# cheat.sh
if [ -f ${HOME}/.cht.sh ]; then
    source ${HOME}/.cht.sh 
fi
