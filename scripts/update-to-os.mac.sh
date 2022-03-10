#!/usr/bin/env bash

proj_home="$(dirname $0)/.."

alacritty_conf="$proj_home/.config/alacritty/alacritty.mac.yml"
nvim_conf="$proj_home/.config/nvim/init.vim"
vscode_conf="$proj_home/Code/User/settings.json"
tmux_conf="$proj_home/.tmux.conf"
bash_conf="$proj_home/.bashrc"
theme_file="$proj_home/.oh-my-bash/themes/gitbasher/gitbasher.theme.sh"

test -d "$HOME/.config/nvim" || mkdir -p "$HOME/.config/nvim"
test -d "$HOME/.config/alacritty" || mkdir -p "$HOME/.config/alacritty"
test -d "$HOME/Library/Application Support/Code/User" || mkdir -p "$HOME/Library/Application Support/Code/User"
test -d "$HOME/.oh-my-bash/themes/gitbasher" || mkdir -p "$HOME/.oh-my-bash/themes/gitbasher"

cp -v $nvim_conf "$HOME/.config/nvim/init.vim"
cp -v $alacritty_conf "$HOME/.config/alacritty/alacritty.yml"
cp -v $vscode_conf "$HOME/Library/Application Support/Code/User/settings.json"
cp -v $tmux_conf "$HOME/.tmux.conf"
cp -v $bash_conf "$HOME/.bashrc"
cp -v $bash_conf "$HOME/.bash_profile"
cp -v $theme_file "$HOME/.oh-my-bash/themes/gitbasher/gitbasher.theme.sh"
