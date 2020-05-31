#!/bin/bash

BASEDIR=$(dirname "$0")

if [ -z "$SUDO_USER" ]; then
    echo "This script is only allowed to run from sudo";
    exit -1;
fi

echo "Uninstalling APACHE..."
echo
sudo apt-get autoremove apache2 -y
sudo apt-get purge apache2 -y

echo
echo "Uninstalling PHP..."
echo
sudo apt autoremove php7.3 php7.3-gd php7.3-sqlite3 php7.3-curl php7.3-zip php7.3-xml php7.3-mbstring php7.3-mysql php7.3-bz2 php7.3-intl php7.3-smbclient php7.3-imap php7.3-gmp -y
sudo apt purge php7.3 php7.3-gd php7.3-sqlite3 php7.3-curl php7.3-zip php7.3-xml php7.3-mbstring php7.3-mysql php7.3-bz2 php7.3-intl php7.3-smbclient php7.3-imap php7.3-gmp -y


echo
echo "Installing APACHE.."
echo
sudo apt install apache2 -y

echo
echo "Installing PHP..."
sudo apt install php7.3 php7.3-gd php7.3-sqlite3 php7.3-curl php7.3-zip php7.3-xml php7.3-mbstring php7.3-mysql php7.3-bz2 php7.3-intl php7.3-smbclient php7.3-imap php7.3-gmp -y

echo
echo "Restarting APACHE Server..."
sudo service apache2 restart 


