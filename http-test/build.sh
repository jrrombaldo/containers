#!/usr/bin/env bash

# GENERIC IMAGE BUILD
cd $DIR
docker build -t $CONTAINER .
docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD";
docker push $CONTAINER:latest
docker logout