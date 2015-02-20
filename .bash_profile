if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

# For my docker bros
export DOCKER_HOST=tcp://127.0.0.1:4243

export NODE_ENV=development
export GREP_OPTIONS='--color=auto'

# Go environment variables
export GOPATH=~/Workspace/golang
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

export PYTHONPATH=/usr/local/lib/python2.7/site-packages

source ~/git-completion.bash

#showing git branches in bash prompt
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

function brand {
  echo -e "\xe2\x9a\xa1" #⚡️ without trailing whitespace utf8
}

function init {
  local          RED="\[\033[0;31m\]"
  local    LIGHT_RED="\[\033[1;31m\]"
  local       YELLOW="\[\033[0;33m\]"
  local  LIGHT_GREEN="\[\033[1;32m\]"
  local        WHITE="\[\033[1;37m\]"
  local   LIGHT_GRAY="\[\033[0;37m\]"
  local    DARK_GRAY="\[\033[1;30m\]"
  local LIGHT_PURPLE="\[\033[1;34m\]"
  local   LIGHT_BLUE="\[\033[0;36m\]"
  local        BLACK="\[\033[0;30m\]"

  PS1="\$(brand)  $WHITE\W$LIGHT_GRAY \$(parse_git_branch)$WHITE" 
}

init


source $(brew --prefix nvm)/nvm.sh
nvm use v0.10.35

ulimit -n 10000

PATH=$PATH:/usr/local/sbin
PATH=$PATH:~/Workspace/depot_tools

### rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

## CDPATH
source ~/.cdpath

## 256 colors
export TERM=xterm-256color
