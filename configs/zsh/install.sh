#! /bin/bash

sudo apt-get install -y zsh wget ripgrep fd-find trash-cli

# fnd is called fndfind in ubuntu, symlink it.
mkdir -p ~/.local/bin
ln -sf "$(which fdfind)" ~/.local/bin/fd

# brew install macos-trash	
# yay -S zsh-completions-git zsh

~/Config/vendor/fzf/install --all
rm -f ~/Config/configs/zsh/zgen/init.zsh
ln -sf ~/Config/configs/zsh/zgen ~/.zgen 2>/dev/null
ln -sf ~/Config/configs/zsh/zshrc ~/.zshrc 2>/dev/null
