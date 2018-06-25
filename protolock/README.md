# Protolock

[![Build Status](https://img.shields.io/travis/webplates/docker-protolock.svg?style=flat-square)](https://travis-ci.org/webplates/docker-protolock)
[![Docker Image](https://img.shields.io/badge/docker%20image-webplates%2Fprotolock-blue.svg?style=flat-square)](https://hub.docker.com/r/webplates/protolock)

**Track your .proto files and prevent changes to messages and services which impact API compatibilty.**


## Usage

```bash
$ docker pull webplates/protolock
$ docker run --rm -it -v $PWD:/proto webplates/protolock status
```


## License

The MIT License (MIT). Please see [License File](LICENSE) for more information.
