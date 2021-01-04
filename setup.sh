#!/bin/bash

# http://csapp.cs.cmu.edu/3e/labs.html

container=$(docker run --security-opt seccomp=unconfined -dt -v $(pwd):/home ubuntu:latest)
docker exec -it $container /bin/bash -c \
    "apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install gcc-multilib cmake git gdb -y && \
    cd home && \
    bash"