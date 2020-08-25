FROM php:7.4-apache
WORKDIR /var/www
RUN apt-get update; apt-get -y install vim less iputils-ping libzip-dev zip unzip; \
    apt-get -y -f install mariadb-client git curl
RUN docker-php-ext-configure zip --with-zip \
    && docker-php-ext-install zip pdo pdo_mysql
RUN cd; \
    curl -k -sS https://getcomposer.org/installer -o composer-setup.php; \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN mkdir -p  /etc/apache2/from-host
RUN echo "" >> /etc/apache2/apache2.conf \
    && echo "# Include the configurations from the host machine" >> /etc/apache2/apache2.conf \
    && echo "IncludeOptional from-host/*.conf" >> /etc/apache2/apache2.conf \
    && a2dissite 000-default
EXPOSE 80
COPY resources/.ssh/* /root/.ssh/
COPY resources/.composer/.htaccess /root/.composer/.htaccess
COPY resources/.composer/auth.json-basic /root/.composer/auth.json-basic
COPY resources/.composer/auth.json-both /root/.composer/auth.json-both
COPY resources/.composer/auth.json-oath /root/.composer/auth.json-oath
RUN chmod 600 /root/.ssh/id_rsa; \
    chmod 644 /root/.ssh/id_rsa.pub
RUN a2enmod rewrite && a2enmod actions && a2enmod proxy_fcgi && a2enmod headers