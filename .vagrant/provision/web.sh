#!/bin/bash

echo "Provisioning the web server"

/vagrant/.vagrant/provision/packages/install-apache2.4.sh
/vagrant/.vagrant/provision/packages/install-php7.4-fpm.sh
#/vagrant/.vagrant/provision/packages/install-mailhog.sh
#/vagrant/.vagrant/provision/packages/install-proftp.sh
/vagrant/.vagrant/provision/packages/install-composer.sh
