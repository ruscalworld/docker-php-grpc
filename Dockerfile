ARG PHP_VERSION='7.4'
ARG DISTRIBUTION='bullseye'
FROM php:${PHP_VERSION}-fpm-${DISTRIBUTION}

ADD scripts scripts
ARG DISTRIBUTION

RUN ./scripts/${DISTRIBUTION}-packages.sh
RUN pecl install grpc \
    && docker-php-ext-enable grpc
