#!/bin/bash

echo "Initializing system for the development environment"

###############
# Initialize DB
###############
mysql -h sql.pleasure-plants.local -uroot -proot --execute="CREATE DATABASE IF NOT EXISTS pleasure-plants;"
mysql -h sql.pleasure-plants.local -uroot -proot pleasure-plants < /vagrant/.vagrant/provision/resources/pleasure-plants.sql
