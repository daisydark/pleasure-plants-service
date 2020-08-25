#!/bin/bash

# Installation instructions taken from https://www.lullabot.com/articles/installing-mailhog-for-ubuntu-1604

echo "Installing Mailhog"

# Install "Go" language
sudo apt-get install -y golang-go
sudo mkdir /opt/gocode
export GOPATH=/opt/gocode
echo "export GOPATH=/opt/gocode" >> /home/vagrant/.profile

sudo go get -x github.com/mailhog/MailHog
sudo go get -x github.com/mailhog/mhsendmail

sudo cp /home/vagrant/go/bin/MailHog /usr/local/bin/mailhog
sudo cp /home/vagrant/go/bin/mhsendmail /usr/local/bin/mhsendmail

echo "Starting Mailhog"

sudo cp /vagrant/.vagrant/provision/resources/mailhog.service /etc/systemd/system
sudo chmod -x /etc/systemd/system/mailhog.service

sudo systemctl start mailhog
sudo systemctl enable mailhog
sudo systemctl daemon-reload
