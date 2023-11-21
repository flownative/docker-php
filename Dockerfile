FROM europe-docker.pkg.dev/flownative/docker/base:bookworm

LABEL org.opencontainers.image.authors="Robert Lemke <robert@flownative.com>"

# -----------------------------------------------------------------------------
# PHP
# Latest versions: https://www.php.net/downloads.php

ARG PHP_VERSION
ENV PHP_VERSION=${PHP_VERSION}

ENV PHP_BASE_PATH="/opt/flownative/php" \
    PATH="/opt/flownative/php/bin:$PATH" \
    LOG_DEBUG="false"

USER root

COPY root-files /

RUN export FLOWNATIVE_LOG_PATH_AND_FILENAME=/dev/stdout \
    && /build.sh init \
    && /build.sh prepare \
    && /build.sh build \
    && /build.sh build_extension vips \
    && /build.sh build_extension igbinary \
    && /build.sh disable_extension igbinary \
    && /build.sh build_extension imagick \
    && /build.sh build_extension yaml \
    && /build.sh build_extension phpredis \
    && /build.sh build_extension xdebug \
    && /build.sh disable_extension xdebug \
    && /build.sh build_extension mediawiki-php-excimer \
    && /build.sh disable_extension mediawiki-php-excimer \
    && /build.sh build_extension ssh2 \
    && /build.sh build_extension sqlsrv \
    && /build.sh build_extension pdo_sqlsrv \
    && /build.sh clean

USER 1000
EXPOSE 9000 9001

WORKDIR ${PHP_BASE_PATH}
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "run" ]
