#!/bin/bash

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG --build-arg PROTOC_VERSION=$VERSION .
