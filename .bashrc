test -d $HOME/.oh-my-bash || exit 0

export OSH=$HOME/.oh-my-bash

OSH_THEME="gitbasher" # custom theme

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
  export EDITOR='nvim'
fi

test -d "$HOME/.nvm" || {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

test -f $HOME/.asdf/asdf.sh && . $HOME/.asdf/asdf.sh
test -f $HOME/.asdf/completions/asdf.bash && . $HOME/.asdf/completions/asdf.bash

test -d $HOME/.cargo/bin && export PATH="$PATH:$HOME/.cargo/bin"
test -d $HOME/.yarn/bin && export PATH="$PATH:$HOME/.yarn/bin"
test -d $HOME/.config/yarn/global/node_modules/.bin && export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"

test -f ~/bin/boot && source ~/bin/boot
