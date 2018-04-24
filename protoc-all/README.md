# Protobuf Compiler Docker image

[![Build Status](https://img.shields.io/travis/webplates/docker-protoc-all.svg?style=flat-square)](https://travis-ci.org/webplates/docker-protoc-all)
[![Docker Image](https://img.shields.io/badge/docker%20image-webplates%2Fprotoc--all-blue.svg?style=flat-square)](https://hub.docker.com/r/webplates/protoc-all)

**Docker image for Protobuf Compiler with a lot of plugins preinstalled**


## Usage

```bash
$ docker pull webplates/protoc-all
$ docker run --rm -it -v $PWD:/proto webplates/protoc-all protoc ...
```


## License

The MIT License (MIT). Please see [License File](LICENSE) for more information.
