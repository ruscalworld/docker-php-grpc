ARG PHP_VERSION='7.4'
ARG DISTRIBUTION='bullseye'
FROM php:${PHP_VERSION}-fpm-${DISTRIBUTION}

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk --update add autoconf gcc g++ make zlib-dev linux-headers \
    && pecl install grpc \
    && docker-php-ext-enable grpc
