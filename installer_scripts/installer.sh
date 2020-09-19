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
echo "Copying aliases.."
cat ./aliases >> /home/pi/.bashrc
. /home/pi/.bashrc
echo

# Install packages
echo "Updating PI..."
apt-get update
apt-get upgrade -y
echo

# Configuring Bluetooth
echo "Configuring Bluetooth.."
sudo tar xzf ./bluetooth_config/bluetooth_pairings.tgz -C /
sudo /etc/init.d/bluetooth restart
echo 

echo "Installin SpeedTest CLI..."
apt-get install python-pip -y
pip install speedtest-cli

# Copy fstab file
echo "Copying fstab file to /etc..."
cat ./fstab >>  /etc/fstab

echo
echo "Creating shared folders..."
mkdir -m777 /media/USBHUB1
mkdir -m777 /media/USBHUB2
mkdir -m777 /media/USBHUB3
mkdir -m777 /media/USBHUB4

mkdir -m777 /media/USBPORT1
mkdir -m777 /media/USBPORT2
mkdir -m777 /media/USBPORT3
mkdir -m777 /media/USBPORT4

# Install Samba server
sudo ./samba/smb_installer.sh
