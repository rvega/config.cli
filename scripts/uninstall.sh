#! /bin/bash

docker container stop rvega_devel
docker container rm rvega_devel
docker system prune -a
