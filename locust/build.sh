#!/bin/bash

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG --build-arg LOCUST_VERSION=$VERSION .
docker build -t $DOCKER_IMAGE:$DOCKER_TAG-onbuild --build-arg PARENT_VERSION=$DOCKER_TAG -f Dockerfile.onbuild .
