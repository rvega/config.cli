#! /bin/bash

brew install git zsh wget ripgrep fd macos-trash fzf tree tmux tmuxp gitui neovim-remote neovim clang-format 
git submodule update --init --recursive

# zsh
rm -f ~/Cli/configs/zsh/zgen/init.zsh
ln -sf ~/Cli/configs/zsh/zgen ~/.zgen 2>/dev/null
ln -sf ~/Cli/configs/zsh/zshrc ~/.zshrc 2>/dev/null

# tmux
ln -sf ~/Cli/configs/tmux/tmux.conf ~/.tmux.conf 2>/dev/null

# git 
ln -sf ~/Cli/configs/git/gitconfig ~/.gitconfig

# neovim
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config
ln -fs ~/Cli/configs/neovim/nvim ~/.config/nvim
ln -fs ~/Cli/configs/neovim/clang-format ~/.clang-format
ln -fs ~/Cli/configs/neovim/php-cs-fixer.php ~/.php-cs-fixer.php
	
