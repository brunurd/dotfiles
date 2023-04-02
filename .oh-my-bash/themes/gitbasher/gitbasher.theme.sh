#!/usr/bin/env bash

DEFAULT="\[\033[0;00m\]"
RED="\[\033[1;31m\]" # with bold
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
MAGENTA="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
LIGHT_GREEN="\[\033[0;92m\]"
GRAY="\[\033[0;30m\]"

prompt_sys_name() {
  echo -e $(uname -a | head -n1 | awk '{print $1;}')
}

prompt_git() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo -e "($(git branch --show-current))"
  fi
}

prompt_node() {
  node_exec="node"

  if [[ "$OSTYPE" == "cygwin" ]]; then
    node_exec="node.exe"
  elif [[ "$OSTYPE" == "msys" ]]; then
    node_exec="node.exe"
  elif [[ "$OSTYPE" == "win32" ]]; then
    node_exec="node.exe"
  else
    node_exec="node"
  fi

  has_node=$(command -v $node_exec 2>/dev/null)
  has_npm=$(command -v npm 2>/dev/null)
  node_str=""
  [[ -n $has_node ]] && node_str="node $($node_exec -v)"
  [[ -n $has_npm ]] && node_str="${node_str} (npm $(npm -v))"
  echo -e $node_str
}

prompt_git_dirty() {
  dirty=$(git status -s 2>/dev/null | tail -n 1)
  [[ -n $dirty ]] && echo "$LIGHT_GREEN$1 *"
  [[ -z $dirty ]] && echo "$CYAN$1"
}

prompt_error() {
  [[ "$1" = "0" ]] || echo -e "error: $1"
}

build_prompt() {
  ERROR_NUM=$?
  PS1="$GREEN\u@\h $MAGENTA$(prompt_sys_name) $YELLOW\w $(prompt_git_dirty $(prompt_git)) $GRAY$(prompt_node) $RED$(prompt_error $ERROR_NUM) $DEFAULT\n$ "
}

PROMPT_COMMAND=build_prompt
