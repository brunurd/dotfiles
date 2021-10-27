# Bruno Araujo dotfiles

Just my files back-up and/or reference.  


If you for some reason want to try my neovim settings, two tips: 
1. I usually use in an Ubuntu WSL2, to apply those run the command: `make update-to-os` or `./scripts/update-to-wsl.sh` to install all dependencies
2. You could use the Windows Terminal, but in my case I use the Windows version of Alacritty, if you are using a bash emulator (like Git Bash) just run the copy command:
```bash
mkdir -p $HOME/AppData/Roaming/alacritty
cp .config/alacritty/alacritty.windows.yml $HOME/AppData/Roaming/alacritty/alacritty.yml
```

### Neovim preview
![preview](screenshot.png)

---

## That includes
- [neovim](.config/nvim/init.vim)
- [alacritty](.config/alacritty/alacritty.windows.yml)
- [vscode](Code/User/settings.json)
- [tmux](.tmux.conf)

---
### Dependencies
- make _(optional: for handling the scripts calls)_
- [FiraCode Nerd Font _(optional: for alacritty config)_](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip)
- [python >= 3.x](https://www.python.org/downloads/)
- [pynvim](https://github.com/neovim/pynvim#install)
- [jedi](https://jedi.readthedocs.io/en/latest/docs/installation.html)
- [dotnet sdk](https://dotnet.microsoft.com/download)

---
### Tools
- bash
- [tmux](https://tmuxguide.readthedocs.io/en/latest/tmux/tmux.html#installation)
- [neovim >= 0.5](https://code.launchpad.net/~neovim-ppa/+archive/ubuntu/unstable)
- [alacritty](https://github.com/alacritty/alacritty/releases)
- [vim-plug](https://github.com/junegunn/vim-plug#installation)
- [oh-my-bash](https://github.com/ohmybash/oh-my-bash#basic-installation)
- [vscode](https://code.visualstudio.com/download)
