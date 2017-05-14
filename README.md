# Migrate Docker image

**Docker image wrapping [mattes/migrate](https://github.com/mattes/migrate)**


## Usage

``` bash
$ docker pull webplates/migrate
$ docker run --rm -it webplates/migrate
```

In order to effectvely run migrations, you need to mount a volume and configure the database parameters:

``` bash
$ docker run --rm -it -v $PWD:/work -w /work webplates/migrate -path migrations/ -database mysql://user:pass@tcp\(host:3306\)/db up
```

## License

The MIT License (MIT). Please see [License File](LICENSE) for more information.
