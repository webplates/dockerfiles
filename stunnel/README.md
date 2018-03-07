# Stunnel image

[Build Status](https://img.shields.io/badge/version-0.53-blue.svg?style=flat-square)

**Docker image for [Stunnel](https://www.stunnel.org/)**

## Usage

```bash
$ docker pull webplates/stunnel
$ docker run --rm -it -v $PWD/conf.d/:/etc/stunnel/conf.d webplates/stunnel
```
