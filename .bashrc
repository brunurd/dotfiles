case $- in
*i*) ;;
*) return ;;
esac

export OSH=$HOME/.oh-my-bash

OSH_THEME="gitbasher" # custom theme

OMB_USE_SUDO=true

completions=(
  awscli
  brew
  compose
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

source "$OSH"/oh-my-bash.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="nvim"
fi

export PATH="$PATH:.:/Users/baraujo/.local/bin"

test -d "$HOME/.nvm" || {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
}

test -f $HOME/.asdf/asdf.sh && . $HOME/.asdf/asdf.sh
test -f $HOME/.asdf/completions/asdf.bash && . $HOME/.asdf/completions/asdf.bash

test -f "$HOME/.cargo/env" && . "$HOME/.cargo/env"
test -d $HOME/.cargo/bin && export PATH="$PATH:$HOME/.cargo/bin"
test -d $HOME/.yarn/bin && export PATH="$PATH:$HOME/.yarn/bin"
test -d $HOME/.config/yarn/global/node_modules/.bin && export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"

# pnpm
test -d $HOME/.local/share/pnpm && {
  export PNPM_HOME="$HOME/.local/share/pnpm"
  export PATH="$PNPM_HOME:$PATH"
}

# add Pulumi to the PATH
test -d $HOME/.pulumi/bin && export PATH=$PATH:$HOME/.pulumi/bin

# msys2 paths
if [[ "$(uname -a)" == *"MSYS"* ]]; then
  test -d /c/msys64/mingw64/bin && export PATH="$PATH:/c/msys64/mingw64/bin"
  test -d /c/msys64/usr/bin && export PATH="$PATH:/c/msys64/usr/bin"
fi

# tmux fix
tmux() {
  TMUX="command tmux ${@}"
  SHELL=/usr/bin/bash script -qO /dev/null -c "eval $TMUX"
}

# Configuration for node to trust the PayPal Proxy Certificates
test -f "/usr/local/etc/openssl/certs/paypal_proxy_cacerts.pem" && export NODE_EXTRA_CA_CERTS="/usr/local/etc/openssl/certs/paypal_proxy_cacerts.pem"

# Setting PATH for Python 3.9
# The original version is saved in .bash_profile.pysave
test -d "/Library/Frameworks/Python.framework/Versions/3.9/bin" && export PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:$PATH"

# Configuration for Python, PIP, OpenSSL to trust the PayPal Proxy Certificates
test -f "/usr/local/etc/openssl/certs/combined_cacerts.pem" && export REQUESTS_CA_BUNDLE="/usr/local/etc/openssl/certs/combined_cacerts.pem"
test -f "/usr/local/etc/openssl/certs/combined_cacerts.pem" && export SSL_CERT_FILE="/usr/local/etc/openssl/certs/combined_cacerts.pem"

# MacPorts
test -d "/opt/local/bin" && export PATH="/opt/local/bin:$PATH"
test -d "/opt/local/sbin" && export PATH="/opt/local/sbin:$PATH"

test -f ~/bin/boot && source ~/bin/boot
