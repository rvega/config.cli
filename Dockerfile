# rvega's command line based devel environment in a docker container.

FROM ubuntu:22.04

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV TZ=Europe/Berlin

RUN apt-get update 
RUN apt-get -y install sudo git zsh

RUN useradd --create-home --shell /bin/zsh rvg
RUN echo 'rvg:098' | chpasswd
RUN usermod -aG sudo rvg

USER rvg
WORKDIR /home/rvg/Projects

