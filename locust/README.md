# Locust image

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
