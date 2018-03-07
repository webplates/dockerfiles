#!/bin/bash

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG --build-arg STUNNEL_VERSION=$VERSION .
