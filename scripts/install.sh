#! /bin/bash

sudo apt-get update
sudo apt-get install -y git
git submodule update --init --recursive

cd ../configs/zsh
./install.sh

cd ../tmux
./install.sh

cd ../neovim
./install.sh

cd ../git
./install.sh

