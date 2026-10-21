ARG PHP_VERSION='8.5'
ARG DISTRIBUTION='trixie'
FROM php:${PHP_VERSION}-fpm-${DISTRIBUTION}

ADD scripts scripts
ARG DISTRIBUTION

RUN ./scripts/${DISTRIBUTION}-packages.sh
# pecl.php.net occasionally fails to respond, so retry the download before building
RUN cd /tmp \
    && for i in 1 2 3 4 5; do pecl download grpc && break; sleep $((i * 10)); done \
    && pecl install /tmp/grpc-*.tgz \
    && rm /tmp/grpc-*.tgz \
    && docker-php-ext-enable grpc
