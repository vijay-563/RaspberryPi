sudo brctl addbr usb2eth 
sudo brctl addif usb2eth eth0 
sudo brctl addif usb2eth usb0 
sudo brctl stp usb2eth on 
sudo ifconfig usb2eth up
