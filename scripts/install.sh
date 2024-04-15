#! /bin/bash

sudo apt-get update
sudo apt-get install -y git

cd ../configs/zsh
./install.sh

cd ../tmux
./install.sh

cd ../neovim
./install.sh

