# Beanstalkd Docker image

[![Build Status](https://img.shields.io/travis/webplates/docker-beanstalkd.svg?style=flat-square)](https://travis-ci.org/webplates/docker-beanstalkd)
[![Docker Image](https://img.shields.io/badge/docker%20image-webplates%2Fbeanstalkd-blue.svg?style=flat-square)](https://hub.docker.com/r/webplates/beanstalkd)

**Docker image for [Beanstalkd](http://kr.github.io/beanstalkd).**


## Usage

The following command will start a beanstalkd container in the foreground:

```bash
$ docker run --rm webplates/beanstalkd
```

Locally you very likely want to run it as a daemon:

```bash
$ docker run -d --name beanstalkd -p 11300:11300 webplates/beanstalkd
```


### Beanstalk Console

There is a great application called [Beanstalk Console](https://github.com/ptrofimov/beanstalk_console)
which runs perfectly in a [Docker container](https://github.com/ptrofimov/beanstalk_console#run-as-a-docker-container)
and can be used with the setup above:

```bash
$ docker run -d --name beanstalk_console -p 80:80 --link beanstalkd -e BEANSTALKD_HOST=beanstalkd -e BEANSTALKD_PORT=11300 agaveapi/beanstalk_console
```

**Note:** You might want to choose another local port instead of 80.


## Configuration

The following environment variables can be used for configuration:

- `BEANSTALK_DIR` (value: text): wal directory
- `BEANSTALK_FSYNC` (value: number): fsync at most once every MS milliseconds
- `BEANSTALK_MAX_JOB_SIZE` (value: number): set the maximum job size in bytes
- `BEANSTALK_MAX_WAL_SIZE` (value: number): set the size of each wal file
- `BEANSTALK_NO_COMPACT` (value: true): do not compact the binlog
- `BEANSTALK_VERBOSE` (value: true): increase verbosity


## License

The MIT License (MIT). Please see [License File](LICENSE) for more information.
