#!/bin/bash

# Set VIM_SERVERNAME var if not set
# The idea is to `export VIM_SERVERNAME="foo"` from a terminal
# and now you have another named server
[ -z "$VIM_SERVERNAME" ] && VIM_SERVERNAME="rvg_vim_server" 

# If there's a filename as in `v filename.txt`
if [ $# != 0 ]; then
    NVR_BIN=nvr
    NVIM_LISTEN_ADDRESS=/tmp/${VIM_SERVERNAME} ${NVR_BIN} -s --remote "$@"
else 
    if [ -e /tmp/${VIM_SERVERNAME} ]; then
        nvim
    else
        NVIM_LISTEN_ADDRESS=/tmp/${VIM_SERVERNAME} nvim
    fi
fi
