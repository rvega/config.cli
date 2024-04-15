#! /bin/bash

apt-get update
apt-get install sudo zsh
useradd --create-home --shell /bin/zsh rvg
echo 'rvg:098' | chpasswd
usermod -aG sudo rvg
