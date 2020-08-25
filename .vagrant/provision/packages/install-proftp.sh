#!/bin/bash

echo "Installing ProFtp"

sudo debconf-set-selections <<< "proftpd-basic shared/proftpd/inetd_or_standalone select standalone"
sudo apt-get -y install proftpd-basic
sudo adduser --home /home/user user --shell /bin/bash --gecos "" --disabled-password
echo "user:user" | sudo chpasswd
sudo cp /vagrant/.vagrant/provision/resources/proftpd.conf /etc/proftpd/conf.d/
