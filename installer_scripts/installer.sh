#!/bin/bash

if [ -z "$SUDO_USER" ]; then
    echo "This script is only allowed to run from sudo";
    exit -1;
fi

# Install packages
echo "Updating PI..."
#apt-get update
#apt-get upgrade -y

# Copy fstab file
echo "Copying fstab file to /etc"
cp fstab /etc

echo
echo "Creating shared folders..."
mkdir -m777 /media/USBHUB1_1
mkdir -m777 /media/USBHUB2_1
mkdir -m777 /media/USBHUB3_1
mkdir -m777 /media/USBHUB4_1

mkdir -m777 /media/USBPORT1
mkdir -m777 /media/USBPORT2
mkdir -m777 /media/USBPORT3
mkdir -m777 /media/USBPORT4

# Install Samba server
sudo ./samba/smb_installer.sh
