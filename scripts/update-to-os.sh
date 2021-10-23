#!/usr/bin/env bash

proj_home="$(dirname $0)/.."

alacritty_conf="$proj_home/.config/alacritty/alacritty.yml.linux"
nvim_conf="$proj_home/.config/nvim/init.vim"
vscode_conf="$proj_home/.config/Code/User/settings.json"
tmux_conf="$proj_home/.tmux.conf"

test -d "$HOME/.config/nvim" || mkdir -p "$HOME/.config/nvim"
test -d "$HOME/.config/alacritty" || mkdir -p "$HOME/.config/alacritty"
test -d "$HOME/.config/Code/User" || mkdir -p "$HOME/.config/Code/User"

cp -v $nvim_conf "$HOME/.config/nvim/init.vim"
cp -v $alacritty_conf "$HOME/.config/alacritty/alacritty.yml"
cp -v $vscode_conf "$HOME/Code/User/settings.json"
cp -v $tmux_conf "$HOME/.tmux.conf"
