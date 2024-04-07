# TODO

[] Trash and rm
[] Clipboard



# Install dependencies in MacOS.

brew install homebrew/cask/docker


# Create the image.

docker build . -t rvega_devel_img


# Run a container (instance of an image).

docker run -dit --name rvega_devel --user rvg -p 80:80 -v /Users/Rafa/Projects:/home/rvg/Projects rvega_devel_img

# Connect to terminal

docker start rvega_devel
docker exec -it rvega_devel --user rvg /bin/bash





<!-- `docker pull archlinux:latest`  // Get an image from the docker repos. -->
<!-- `docker run -dit --name my_arch_container -p 80:80 -v [PATH IN HOST MACHINE]:[PATH IN GUEST CONTAINER] archlinux:latest`  // Create a container by running the image. --> 
<!-- `docker start my_arch_container`  // Run the container. -->
<!-- `docker exec -it my_arch_container /bin/bash` //Run a terminal in the container. -->

<!-- If you want to start from a custom image, you need to create a Dockerfile. --> 
