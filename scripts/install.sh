#! /bin/bash

docker build .. -t rvega_devel_img
docker run -dit \
    --name rvega_devel \
    --hostname rvg_devel \
    --user rvg \
    --volume ./../configs:/home/rvg/Config \
    --volume /Users/Rafa/Projects:/home/rvg/Projects \
    rvega_devel_img
    
docker start rvega_devel
# docker exec -it rvega_devel /home/rvg/Config/post_install.sh

# docker run -dit --name rvega_devel --user rvg -p 80:80 -v /Users/Rafa/Projects:/home/rvg/Projects rvega_devel_img
