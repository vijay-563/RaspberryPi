#!/bin/bash

BASEDIR=$(dirname "$0")

if [ -z "$SUDO_USER" ]; then
    echo "This script is only allowed to run from sudo";
    exit -1;
fi

echo "Uninstalling MYSQL..."
echo
sudo apt install mariadb-server -y
sudo apt-get purge apache2 -y

echo

echo
echo "Installing MYSQL.."
echo
sudo apt install mariadb-server -y

echo
echo "Configuring Secure MYSQLP..."
sudo mysql_secure_installation -y

echo


