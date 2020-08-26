FROM php:7.4-apache
WORKDIR /var/www
RUN apt-get update; apt-get -y install apt-utils; \
    apt-get -y install vim less iputils-ping libzip-dev zip unzip; \
    apt-get -y -f install mariadb-client git
RUN docker-php-ext-configure zip --with-zip \
    && docker-php-ext-install zip pdo pdo_mysql
RUN cd; \
    curl -k -sS https://getcomposer.org/installer -o composer-setup.php; \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer

RUN pecl install xdebug-2.8.0
RUN docker-php-ext-enable xdebug
RUN echo "xdebug.idekey=PHPSTORM" >> /usr/local/etc/php/php.ini; \
    echo "xdebug.remote_host=192.168.50.1" >> /usr/local/etc/php/php.ini; \
    echo "xdebug.remote_enable=1" >> /usr/local/etc/php/php.ini; \
    echo "memory_limit = -1" >> /usr/local/etc/php/php.ini; \
    sed -i 's/\/var\/www\/html$/\/var\/www\/public/' /etc/apache2/sites-available/000-default.conf; \
    sed -i 's/\/var\/www\/html$/\/var\/www\/public/' /etc/apache2/sites-available/default-ssl.conf
RUN a2enmod rewrite
RUN a2enmod headers
COPY resources/.ssh/* /root/.ssh/
RUN chmod 600 /root/.ssh/id_rsa; \
    chmod 644 /root/.ssh/id_rsa.pub
