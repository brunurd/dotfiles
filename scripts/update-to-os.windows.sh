#!/usr/bin/env bash

proj_home="$(dirname $0)/.."

alacritty_conf="$proj_home/.config/alacritty/alacritty.windows.yml"
nvim_conf="$proj_home/.config/nvim/init.vim"
vim_conf="$proj_home/.vimrc"
vscode_conf="$proj_home/Code/User/settings.json"
bash_conf="$proj_home/.bashrc"
theme_file="$proj_home/.oh-my-bash/themes/gitbasher/gitbasher.theme.sh"

test -d "$HOME/AppData/Local/nvim" || mkdir -p "$HOME/AppData/Local/nvim"
test -d "$HOME/AppData/Roaming/alacritty" || mkdir -p "$HOME/AppData/Roaming/alacritty"
test -d "$HOME/AppData/Roaming/Code/User" || mkdir -p "$HOME/AppData/Roaming/Code/User"
test -d "$HOME/.oh-my-bash/themes/gitbasher" || mkdir -p "$HOME/.oh-my-bash/themes/gitbasher"

cp -v "$nvim_conf" "$HOME/AppData/Local/nvim/init.vim"
cp -v "$vim_conf" "$HOME/.vimrc"
cp -v "$alacritty_conf" "$HOME/AppData/Roaming/alacritty/alacritty.yml"
cp -v "$vscode_conf" "$HOME/AppData/Roaming/Code/User/settings.json"
cp -v "$bash_conf" "$HOME/.bashrc"
cp -v "$theme_file" "$HOME/.oh-my-bash/themes/gitbasher/gitbasher.theme.sh"
