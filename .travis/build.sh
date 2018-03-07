#!/bin/bash

if [[ -z $1 ]]; then
    echo "Build image cannot be empty"
    exit 1
fi

if [[ $2 != "true" ]]; then
    echo "Skip building image $1"
    exit 0
fi

echo "Building image $1"
