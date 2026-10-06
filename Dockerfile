# -----------------------------------------------------------------------------
# Build envsubst for the target architecture.
#
# This image ships the Go implementation of envsubst (github.com/a8m/envsubst)
# rather than the GNU one, which would pull in gettext. Images based on this
# one rely on it being available as well.
#
# The stage runs on the build platform and cross-compiles, so no emulation is
# involved.

FROM --platform=$BUILDPLATFORM golang:1-alpine AS envsubst-builder

ARG ENVSUBST_VERSION=v1.4.2
ARG TARGETOS
ARG TARGETARCH

WORKDIR /src
RUN go mod init envsubst-build \
    && go get github.com/a8m/envsubst/cmd/envsubst@${ENVSUBST_VERSION} \
    && CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} \
       go build -o /out/envsubst github.com/a8m/envsubst/cmd/envsubst

# -----------------------------------------------------------------------------
# The actual image

FROM harbor.flownative.io/docker/base:trixie-slim

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

COPY --from=envsubst-builder /out/envsubst /usr/local/bin/envsubst

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
    && /build.sh build_extension php-spx \
    && /build.sh disable_extension php-spx \
    && /build.sh build_extension php-excimer \
    && /build.sh disable_extension php-excimer \
    && /build.sh build_extension ssh2 \
    && /build.sh build_extension mongodb \
    && /build.sh clean

USER 1000
EXPOSE 9000 9001

# terminate with SIGQUIT which is handled gracefully by php-fpm
# contrary to SIGTERM which terminates php-fpm immediately.
STOPSIGNAL SIGQUIT

WORKDIR ${PHP_BASE_PATH}
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "run" ]
