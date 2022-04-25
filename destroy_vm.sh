#!/bin/bash


#Stop the machine
sudo virsh destroy ubuntu2204

# To clean including the name spaces
sudo virsh undefine ubuntu2204

#Removce the boot image
sudo rm -rf /var/lib/libvirt/images/cloud.img

#Remove the disk image
sudo rm -rf /var/lib/libvirt/images/ubuntu2204.img