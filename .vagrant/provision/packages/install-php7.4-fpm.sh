#!/bin/bash

echo "Installing php7.4 fpm"

sudo add-apt-repository -y  ppa:ondrej/php
sudo apt update
sudo apt install -y php7.4-fpm php7.4-mysql php7.4-xml php7.4-curl php7.4-zip php7.4-mcrypt php7.4-intl php7.4-cli php7.4-mbstring php7.4-gd php7.4-soap php7.4-curl
sudo a2enmod actions fastcgi alias proxy_fcgi
sudo cp /vagrant/.vagrant/provision/resources/pleasure-plants-local.conf /etc/apache2/sites-available
sudo a2dissite 000-default.conf
sudo a2ensite pleasure-plants-local.conf
sudo systemctl reload apache2
