# Stunnel Docker image

[![Build Status](https://img.shields.io/travis/webplates/docker-stunnel.svg?style=flat-square)](https://travis-ci.org/webplates/docker-stunnel)
[![Docker Image](https://img.shields.io/badge/docker%20image-webplates%2Fstunnel-blue.svg?style=flat-square)](https://hub.docker.com/r/webplates/stunnel)

**Docker image for [Stunnel](https://www.stunnel.org/)**


## Usage

```bash
$ docker pull webplates/stunnel
$ docker run --rm -it -v $PWD/conf.d/:/etc/stunnel/conf.d webplates/stunnel
```


## License

The MIT License (MIT). Please see [License File](LICENSE) for more information.
