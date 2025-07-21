#! /bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
        sudo pacman -Syu
        sudo pacman -S --needed base-devel
        if ! command -v paru 2>&1 >/dev/null; then
            git clone https://aur.archlinux.org/paru.git /tmp/paru
            cd /tmp/paru
            makepkg -si
        fi
	paru -S git zsh wget ripgrep fd trash-cli fzf tree tmux tmuxp gitui neovim-remote neovim clang python luarocks lf 
        chsh -s /bin/zsh
elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew install git zsh wget ripgrep fd macos-trash fzf tree tmux tmuxp gitui neovim-remote neovim clang-format python luarocks lf 
        pip install --upgrade pynvim
fi
	
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
# ln -sf ~/Cli/configs/clang-format /mnt/c/Users/admin/.clang-format  # WSL
ln -fs ~/Cli/configs/clang-format ~/.clang-format
nvim --headless +PlugInstall +qa 2>/dev/null 
nvim --headless +PlugInstall +qa	

# lf file manager.
mkdir -p ~/.config/lf
ln -fs ~/Cli/configs/lf/lfrc ~/.config/lf/lfrc

# Misc
ln -fs ~/Cli/configs/clang-format ~/.clang-format
