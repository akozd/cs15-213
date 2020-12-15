#!/bin/bash

name="cs15213"
docker kill $name
container=$(docker run --name $name -dt -v $(pwd):/home ubuntu:latest | docker start cs15213)
docker exec -it $container /bin/bash -c \
    "apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install gcc-multilib cmake git -y && \
    cd home && \
    bash"