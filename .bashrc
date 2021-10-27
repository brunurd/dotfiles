test -d $HOME/.oh-my-bash || exit 0

export OSH=$HOME/.oh-my-bash

OSH_THEME="brunurd" # custom theme

completions=(
  awscli
  brew
  defaults
  django
  docker-compose
  docker
  gem
  gh
  git
  go
  gradle
  kubectl
  makefile
  maven
  minikube
  npm
  nvm
  pip
  pip3
  ssh
  terraform
  tmux
  vagrant
  virtualbox
)

aliases=(
  general
)

plugins=(
  ansible
  aws
  bashmarks
  brew
  git
  golang
  kubectl
  npm
  nvm
)

source $OSH/oh-my-bash.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

test -f ~/bin/boot && source ~/bin/boot
