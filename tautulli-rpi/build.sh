#!/usr/bin/env bash

# GENERIC IMAGE BUILD
git clone https://github.com/Tautulli/Tautulli-Docker
cd ./Tautulli-Docker
docker build -t $CONTAINER .
cd ..
docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD";
docker push $CONTAINER:latest
docker logout