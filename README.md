# Command line devel environment.

This is my command line "IDE". It's zsh, tmux and neovim with custom configs. This is meant to be run on a terminal emulator. Tested on Arch Linux (real linux machine or WSL2 in windows), MacOs and Windows 11. 

## Install

### Arch Linux

1. Clone this repo to ~/Cli

1. Run `~/Cli/scripts/install.sh`
```
git clone git@github.com:rvega/config.cli.git ~/Cli
cd ~/Cli/scripts
./install.sh
```
### MacOs

1. Install [homebrew](https://brew.sh).

1. Clone this repo to ~/Cli

1. Run `~/Cli/scripts/install.sh`
```
git clone git@github.com:rvega/config.cli.git ~/Cli
cd ~/Cli/scripts
./install.sh
```
### Windows 11.

#### Native Windows 

This is better for C++ stuff, specially with MSVC.

This scripts assume your username is admin, change if needed.

*Note:* For C++ development with microsoft build tools, use the shell "Developer Power Shell for VS 2019" (or whatever version you need). This will integrate nicely with clang LSP, compile_commands.json, and all that C++ stuff.

1. Install [chocolatey](https://chocolatey.org/).

1. In powershell as admin, clone this repo to ~/Cli and run install.ps1
```
choco install git
git clone git@github.com:rvega/config.cli.git ~/Cli
cd ~/Cli/scripts
./install.ps1
```
#### WSL2 

This is just like being on linux, with tmux and all, but integration c++ stuff is no good. 

1. Install Arch on WSL https://wiki.archlinux.org/title/Install_Arch_Linux_on_WSL

1. Follow the linux instructions above.





