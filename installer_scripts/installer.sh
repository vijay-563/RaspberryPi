#!/bin/bash

if [ -z "$SUDO_USER" ]; then
    echo "This script is only allowed to run from sudo";
    exit -1;
fi

CURRENT_PASSWD=raspberry
NEW_PASSWD=vijayakumar

# Change the password
echo "Changing the password..."
(echo "$NEW_PASSWD"; echo "$NEW_PASSWD") | passwd

ret=$?

if [ $ret -ne 0 ]; then
   echo "Unable to change the password.";
   exit -1;
else
   echo "Password changed successfully..."
fi
echo

# Copy Aliases
#cat ./aliases.sh >> /home/pi/.bashrc
#. ~/.bashrc
#echo "Copied aliases..."

exit 0;
# Install packages
echo "Updating PI..."
apt-get update
apt-get upgrade -y

# Copy fstab file
echo "Copying fstab file to /etc..."
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
