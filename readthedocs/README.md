# Read the Docs Docker image

[![Build Status](https://img.shields.io/travis/webplates/docker-readthedocs.svg?style=flat-square)](https://travis-ci.org/webplates/docker-readthedocs)
[![Docker Image](https://img.shields.io/badge/docker%20image-webplates%2Freadthedocs-blue.svg?style=flat-square)](https://hub.docker.com/r/webplates/readthedocs)

**Docker image for building Read the Docs documentation (mainly) for PHP projects.**


## Usage

Run the following commands in order to build the documentation:

``` bash
$ docker run --rm --interactive --tty --volume $PWD:/doc webplates/readthedocs
$ # You are now in the docker image
$ make html
$ make spelling
```

Alternatively you can run the commands directly from the host without entering the container shell:

``` bash
$ docker run --rm --tty --volume $PWD:/doc webplates/readthedocs make html
$ docker run --rm --tty --volume $PWD:/doc webplates/readthedocs make spelling
```

There are also simple shortcuts for the two commands above:

``` bash
$ docker run --rm --tty --volume $PWD:/doc webplates/readthedocs build
$ docker run --rm --tty --volume $PWD:/doc webplates/readthedocs check
```

Last, but not least there is a watch command to watch for changes:

``` bash
$ docker run --rm --tty --volume $PWD:/doc webplates/readthedocs watch
```


## Note about permissions

Unless configured otherwise Docker containers run processes with `root` user.
Furthermore the `root` user inside containers is also not "mapped" to any other user
on host machines by default, although [it is possible](https://docs.docker.com/engine/security/security/).

These facts usually end up in permission issues on the host machine
(build artifacts are owned by `root`).

Therefore it's a good idea to manually override the UID and GID when running the containers:

``` bash
$ docker run --rm --tty --volume $PWD:/doc --user $(id -u):$(id -g) webplates/readthedocs ...
```


## Shell support

Typing the above commands is not really convenient. With a simple alias you can
simplify the executed commands:

``` bash
alias doc='docker run --rm --tty --interactive --volume $PWD:/doc --user $(id -u):$(id -g) webplates/readthedocs'
```

(Put this in your shell startup script: `~/.bashrc`, `~/.zshrc`, etc)


Then the commands again:

``` bash
$ doc build
$ doc check
$ doc watch
```


## License

The MIT License (MIT). Please see [License File](LICENSE) for more information.
