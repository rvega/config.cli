#! /bin/bash

ln -sf ~/Config/configs/git/gitconfig ~/.gitconfig

arch=$(uname -i)
if [[ $arch == x86_64* ]]; then
    url=https://github.com/extrawurst/gitui/releases/download/v0.26.1/gitui-linux-x86_64.tar.gz
elif  [[ $arch == arm* ]] || [[ $arch = aarch64 ]]; then
    url=https://github.com/extrawurst/gitui/releases/download/v0.26.1/gitui-linux-aarch64.tar.gz
fi
wget -O gitui.tar.gz "$url"
tar -xzvf gitui.tar.gz
sudo mv gitui /usr/local/bin

