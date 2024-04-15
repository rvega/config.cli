#! /bin/bash

docker build .. -t rvega_devel_img
docker run -dit \
    --name rvega_devel \
    --hostname rvg_devel \
    --user rvg \
    -p 8080:8080 \
    --volume ./../:/home/rvg/Config \
    --volume /Users/Rafa/Projects:/home/rvg/Projects \
    rvega_devel_img
    
docker start rvega_devel

