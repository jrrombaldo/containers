#!/usr/bin/env bash

# GENERIC IMAGE BUILD
docker run --rm --privileged multiarch/qemu-user-static:register --reset
git clone https://github.com/Tautulli/Tautulli-Docker
cd ./Tautulli-Docker
docker build -t $CONTAINER .
docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD";
docker push $CONTAINER:latest
docker logout