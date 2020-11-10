FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
    git \
    curl \
    zip \
    unzip \
    sudo \
    libicu-dev \
    libzip-dev \
    libcurl4-openssl-dev \
    libbz2-dev \
    libpng-dev \
    libjpeg-dev \
    libmcrypt-dev \
    libreadline-dev \
    libfreetype6-dev \
    g++ \
    vim

COPY --from=composer:1.10 /usr/bin/composer /usr/bin/composer

RUN apt-get update && apt-get install -y software-properties-common

RUN docker-php-ext-install \
    curl \
    bz2 \
    intl \
    iconv \
    bcmath \
    zip

RUN pecl install -o -f redis \
&&  docker-php-ext-enable redis
