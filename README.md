# Beanstalk container

This repository provides a list of [Beanstalkd](http://kr.github.io/beanstalkd/) images.


## Configuration

The following environment variables can be used for configuration:

- `BEANSTALK_DIR` (value: text): wal directory
- `BEANSTALK_FSYNC` (value: number): fsync at most once every MS milliseconds
- `BEANSTALK_MAX_JOB_SIZE` (value: number): set the maximum job size in bytes
- `BEANSTALK_MAX_WAL_SIZE` (value: number): set the size of each wal file
- `BEANSTALK_NO_COMPACT` (value: true): do not compact the binlog
- `BEANSTALK_VERBOSE` (value: true): increase verbosity
