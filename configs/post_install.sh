#! /bin/bash

cd ~/Config/zsh
make link

cd ~/Config/tmux
make link

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# cd ~/Config/neovim
# rm -rf /home/rvg/Config/neovim/nvim/pack/minpac
# make link
# nvim -c ":call InstallPlugins()"
