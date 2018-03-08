# Locust Docker image

[![Build Status](https://img.shields.io/travis/webplates/docker-locust.svg?style=flat-square)](https://travis-ci.org/webplates/docker-locust)
[![Docker Image](https://img.shields.io/badge/docker%20image-webplates%2Flocust-blue.svg?style=flat-square)](https://hub.docker.com/r/webplates/locust)

**Docker image for [Locust](https://locust.io)**


## Usage

```bash
$ docker pull webplates/locust
$ docker run --rm -it -v $PWD:/locust webplates/locust -f locustfile.py
```

### Aliasing locust

```bash
$ alias locust='docker run --rm -it -v $PWD:/locust webplates/locust'
```


## License

The MIT License (MIT). Please see [License File](LICENSE) for more information.
