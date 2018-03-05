# Stunnel image

[![Build Status](https://img.shields.io/travis/webplates/docker-stunnel.svg?style=flat-square)](https://travis-ci.org/webplates/docker-stunnel)

**Docker image for [Stunnel](https://www.stunnel.org/)**


## Usage

```bash
$ docker pull webplates/stunnel
$ docker run --rm -it -v $PWD/conf.d/:/etc/stunnel/conf.d webplates/stunnel
```


## License

The MIT License (MIT). Please see [License File](LICENSE) for more information.
