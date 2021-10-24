#!/usr/bin/env bash

proj_home="$(dirname $0)/.."

nvim_conf="$proj_home/.config/nvim/init.vim"
tmux_conf="$proj_home/.tmux.conf"
bash_conf="$proj_home/.bashrc"

test -d "$HOME/.config/nvim" || mkdir -p "$HOME/.config/nvim"

cp -v $nvim_conf "$HOME/.config/nvim/init.vim"
cp -v $tmux_conf "$HOME/.tmux.conf"
cp -v $bash_conf "$HOME/.bashrc"
