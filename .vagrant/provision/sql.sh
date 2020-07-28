#!/bin/bash

echo "provisioning the SQL DB server"
echo "Install MariaDB on sql"
/vagrant/.vagrant/provision/packages/install-mariadb.sh

sudo mkdir -p /tmp/pleasure_dbdump
cd /tmp
sudo chmod -R 777 pleasure_dbdump
