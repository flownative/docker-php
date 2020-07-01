# Docker PHP image

[![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)
[![Maintenance level: Love](https://img.shields.io/badge/maintenance-%E2%99%A1%E2%99%A1%E2%99%A1-ff69b4.svg)](https://www.flownative.com/en/products/open-source.html)
![](https://github.com/flownative/docker-beach-php/workflows/Build%20Docker%20Image/badge.svg)
![](https://github.com/flownative/docker-beach-php/workflows/Daily%20Releases/badge.svg)

A Docker image providing [PHP-FPM](https://www.php.net/). Compared to
other PHP images, this one is tailored to run without root privileges.
All processes use an unprivileged user (uid 1000). And much work has
been put into providing proper console output and meaningful messages.

## tl;dr

```bash
$ docker run flownative/php
```

![Screenshot with example log output](docs/php-log-example.png
"Example log output")

## Example usage

Here's an example of a Docker Compose configuration using this image as
a PHP-FPM container. The configuration should give you an idea of how to
integrate the image, but you'll certainly need to provide more code in
order to get it running with your specific application.

For a full-working solution tailored to Neos CMS and Neos Flow, please
have a look at [Local Beach](https://flownative.com/localbeach) instead.

```yaml
version: '3.7'

volumes:
  application:
    name: app
    driver: local

services:
  webserver:
    image: flownative/nginx:3
    ports:
      - "8080"
    volumes:
      - application:/application
    environment:
      - NGINX_PHP_FPM_HOST=app_php.local_beach

  php:
    image: flownative/php:7.4
    volumes:
      - application:/application
    environment:

```

## Configuration

### Logging

By default, the PHP logs are written to STDOUT / STDERR. That way, you
can follow logs by watching container logs with `docker logs` or using a
similar mechanism in Kubernetes or your actual platform.

### Environment variables

| Variable Name        | Type    | Default             | Description                                                                                                           |
|:---------------------|:--------|:--------------------|:----------------------------------------------------------------------------------------------------------------------|
| PHP_BASE_PATH        | string  | /opt/flownative/php | Base path for PHP (read-only)                                                                                         |
| PHP_DATE_TIMEZONE    | string  |                     | Default timezone ([doc](https://www.php.net/manual/en/datetime.configuration.php#ini.date.timezone))                  |
| PHP_ERROR_REPORTING  | string  | -1                  | PHP error reporting log levels ([doc](https://www.php.net/manual/en/errorfunc.configuration.php#ini.error-reporting)) |
| PHP_DISPLAY_ERRORS   | string  | off                 | Display PHP errors ([doc](https://www.php.net/manual/en/errorfunc.configuration.php#ini.display-errors))              |
| PHP_ERROR_LOG        | string  | /dev/stderr         | Path leading to the file where PHP errors should be logged                                                            |
| PHP_MEMORY_LIMIT     | string  | 750M                | PHP memory limit ([doc](https://www.php.net/manual/en/ini.core.php#ini.memory-limit))                                 |
| PHP_XDEBUG_ENABLE    | boolean | false               | Enable or disable the Xdebug extension                                                                                |
| PHP_FPM_USER         | string  | 1000                | User id for running PHP (read-only)                                                                                   |
| PHP_FPM_GROUP        | string  | 1000                | Group id for running PHP (read-only)                                                                                  |
| PHP_FPM_PORT         | string  | 9000                | Port the PHP-FPM process listens to                                                                                   |
| PHP_FPM_MAX_CHILDREN | string  | 20                  | Maximum number of children to run                                                                                     |

## Security aspects

This image is designed to run as a non-root container. Using an
unprivileged user generally improves the security of an image, but may
have a few side-effects, especially when you try to debug something by
logging in to the container using `docker exec`.

When you are running this image with Docker or in a Kubernetes context,
you can take advantage of the non-root approach by disallowing privilege
escalation:

```yaml
$ docker run flownative/php:7.4 --security-opt=no-new-privileges
```

When you exec into this container running bash, you will notice your
prompt claiming "I have no name!". That's nothing to worry about: The
container runs as a user with uid 1000, but in fact that user does not
even exist.

```
$ docker run -ti --name php --rm flownative/php:7.4 bash
I have no name!@5a0adf17e426:/$ whoami
whoami: cannot find name for user ID 1000
```

## Building this image

Build this image with `docker build`. You need to specify the desired
version for some of the tools as build arguments:

```bash
docker build \
    --build-arg PHP_VERSION=7.4.4 \
    -t flownative/php:latest .
```

Check the latest stable release on [php.net](https://www.php.net).

## Maintenance

The Flownative images are built through Github Workflows. A new release
build is triggered whenever a new Git tag is pushed to this repository.
As usual, the tag must follow the syntax "v1.2.3+4". Note that the tag
is used for the code of this repository and has nothing to do with an
actual PHP version.

### New PHP versions

In order to produce images for a new PHP version, update the
`PHP_VERSION` constants found in `.github/workflows/docker.build.yaml`,
commit the result and push it along with a new tag. Note that, because
you did not fix a bug or add a feature of the actual image code, you
should only raise the build version number (ie. v1.2.0+1 becomes
v1.2.0+2). The Github workflow will build images for all supported PHP
branches, tag them and push them to the container registries at Github,
Google and Docker Hub.

### Nightly builds

Each night, the images for the most recent version of each branch will
be rebuilt using the latest Flownative base image (`flownative/base`).

### Trigger

Whenever new images were built, a custom event is triggered which in
turn triggers builds of the `flownative/beach-php` image, which is
derived from this one.
