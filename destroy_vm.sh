#!/bin/bash


#Stop the machine
sudo virsh destroy ubuntu2004

# To clean including the name spaces
sudo virsh undefine ubuntu2004

#Removce the boot image
sudo rm -rf /var/lib/libvirt/images/ubuntu2004.img

#Remove the disk image
sudo rm -rf /var/lib/libvirt/images/ubuntu2004.img