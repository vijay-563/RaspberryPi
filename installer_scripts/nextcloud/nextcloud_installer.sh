#!/bin/bash

SMB_USER=pi
SMB_PASSWD=vijayakumar

BASEDIR=$(dirname "$0")

if [ -z "$SUDO_USER" ]; then
    echo "This script is only allowed to run from sudo";
    exit -1;
fi

echo "Uninstalling SAMBA..."
echo
sudo apt-get autoremove samba samba-common -y
sudo apt-get purge samba samba-common -y

echo
echo "Installing SAMBA.."
echo
echo "samba-common samba-common/workgroup string  WORKGROUP" | sudo debconf-set-selections
echo "samba-common samba-common/dhcp boolean true" | sudo debconf-set-selections
echo "samba-common samba-common/do_debconf boolean true" | sudo debconf-set-selections
sudo apt-get install samba -y
apt-get install samba samba-common-bin -y

echo
echo "Add user to samba"
(echo "$SMB_PASSWD"; echo "$SMB_PASSWD") | smbpasswd -s -a $SMB_USER

echo
echo "Configuring Samba configuraiton file..."
cat $BASEDIR/smb.conf >> /etc/samba/smb.conf

echo
echo "Restarting Samba Server..."
sudo systemctl restart smbd


