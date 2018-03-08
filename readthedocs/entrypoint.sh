#!/bin/bash

set -e

case "$1" in
    "build")
        exec make html ;;
    "check")
        exec make spelling ;;
    "watch")
        while true; do
            bash -c "inotifywait -e modify -r . && make html"
        done
        ;;
    *)
        exec "$@" ;;
esac
