FROM php:7.4-fpm
WORKDIR /var/www
RUN apt-get update && \
    apt-get install -y libxml2-dev libcurl4-gnutls-dev libzip-dev libpng-dev libonig-dev \
    && apt-get clean \
    && docker-php-ext-install pdo pdo_mysql xml curl zip intl mbstring gd soap opcache
COPY opcache.ini /usr/local/etc/php/conf.d