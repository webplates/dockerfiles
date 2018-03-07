#!/bin/bash

if [[ -z $IMAGE ]]; then
    echo "Build image cannot be empty"
    exit 1
fi

export DOCKER_IMAGE=webplates/$IMAGE

if echo $TRAVIS_COMMIT_MESSAGE | grep "\[ci build all\]" > /dev/null; then
    echo "Building all images (including this one: $DOCKER_IMAGE)"
elif [[ $2 != "true" ]]; then
    echo "Skip building image $DOCKER_IMAGE"
    exit 0
fi

echo "Building image $DOCKER_IMAGE"

if [[ -x $IMAGE/build.sh ]]; then
    $IMAGE/build.sh
else
    .travis/build-generic.sh
fi
