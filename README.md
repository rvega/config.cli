# Command line devel environment based on Ubuntu 24.04 

This is my command line "IDE". It's zsh, tmux and nvim with custom configs.This is meant to be ran on a command-line only environment such as a docker container, WSL2 on windows, or a Linux install (virtual or phisical machine).

## Install

### On docker.

1. Install docker

1. Run this:
   ```
   cd scripts
   ./docker_install.sh 
   ./docker_start.sh   # Will start zsh in a docker container
   cd Config/scripts
   ./install.sh
   exit
   ./docker_start.sh
   ```

### Uninstall 

Delete the rvg_devel_img image and the rvg_devel container, or (dangerous) run `cd scripts && ./docker_uninstall.sh` 


## On Ubuntu (WSL2, virtual machine, or physical machine).

1. Install ubuntu 24.04 and make sure you can login as root.

1. Clone this repo to /home/rvg/Config

1. If no normal user was created during install, run the following, log out, log as rvg user.
   ```
   cd scripts
   ./create_user.sh
   ```

1. Run
   ```
   cd scripts
   ./istall.sh
   ```


# TODO

* [ ] Clipboard integration.



