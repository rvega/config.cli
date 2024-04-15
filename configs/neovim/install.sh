#! /bin/bash

sudo apt-get install -y \
    neovim python3-pip clang-format clang clangd cmake npm \
    ninja-build shellcheck ccache

# brew install ripgrep fd clang-format bash-language-server shellcheck vscode-langservers-extracted eslint marksman

pip3 install --user --break-system-packages neovim-remote cmake-language-server jedi-language-server

sudo npm install -g bash-language-server intelephense vscode-langservers-extracted

arch=$(uname -i)
if [[ $arch == x86_64* ]]; then
    url=https://github.com/artempyanykh/marksman/releases/download/2023-12-09/marksman-linux-x64
elif  [[ $arch == arm* ]] || [[ $arch = aarch64 ]]; then
    url=https://github.com/artempyanykh/marksman/releases/download/2023-12-09/marksman-linux-arm64
fi
wget -O marksman "$url"
chmod +x marksman
sudo mv marksman /usr/local/bin


mkdir -p ~/.config
ln -fs ~/Config/configs/neovim/nvim ~/.config/nvim
ln -fs ~/Config/configs/neovim/clang-format ~/.clang-format
ln -fs ~/Config/configs/neovim/php-cs-fixer.php ~/.php-cs-fixer.php
	
