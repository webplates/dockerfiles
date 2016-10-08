#!/bin/bash

# From https://github.com/docker-library/mysql/blob/9f95658f528699d2c2017ca42ad163a9d5c5e7c1/5.7/docker-entrypoint.sh#L5-L8
# if command starts with an option, prepend beanstalkd
if [ "${1:0:1}" = '-' ]; then
    set -- beanstalkd "$@"
fi

# If the executable is beanstalk look for env vars and append them to the arguments
if [ "$1" = 'beanstalkd' ]; then
    BEANSTALK_OPTS=""

    if [ "$BEANSTALK_DIR" ]; then
        mkdir -p $BEANSTALK_DIR
        BEANSTALK_OPTS="$BEANSTALK_OPTS -b $BEANSTALK_DIR"
    fi

    if [ ! -z "$BEANSTALK_FSYNC" ]; then
        BEANSTALK_OPTS="$BEANSTALK_OPTS -f$BEANSTALK_FSYNC"
    fi

    if [ "$BEANSTALK_MAX_JOB_SIZE" ]; then
        BEANSTALK_OPTS="$BEANSTALK_OPTS -z $BEANSTALK_MAX_JOB_SIZE"
    fi

    if [ "$BEANSTALK_MAX_WAL_SIZE" ]; then
        BEANSTALK_OPTS="$BEANSTALK_OPTS -z $BEANSTALK_MAX_WAL_SIZE"
    fi

    if [ ! -z "$BEANSTALK_NO_COMPACT" ]; then
        BEANSTALK_OPTS="$BEANSTALK_OPTS -n"
    fi

    if [ ! -z "$BEANSTALK_VERBOSE" ]; then
        BEANSTALK_OPTS="$BEANSTALK_OPTS -V"
    fi

    set -- "$@" $BEANSTALK_OPTS
fi

exec "$@"
