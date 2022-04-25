#!/bin/bash


#Stop the machine
sudo virsh destroy ubuntu18

# To clean including the name spaces
sudo virsh undefine ubuntu18

#Removce the boot image
sudo rm -rf /var/lib/libvirt/images/cloud.img

#Remove the disk image
sudo rm -rf /var/lib/libvirt/images/U18.04.img