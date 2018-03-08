#!/bin/bash

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG --build-arg BEANSTALK_VERSION=$VERSION -f $DOCKERFILE .
