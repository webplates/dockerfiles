#!/bin/bash

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG --build-arg PROTOLOCK_VERSION=$VERSION --build-arg PROTOLOCK_BUILD=$BUILD .
