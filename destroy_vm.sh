#!/bin/bash

sudo ls -la /var/lib/libvirt/images/

#Stop the machine
sudo virsh destroy ubuntu18

# To clean including the name spaces
sudo virsh undefine ubuntu18

#Removce the boot image
sudo rm -rf /var/lib/libvirt/images/ubuntu18c.img

#Remove the disk image
sudo rm -rf /var/lib/libvirt/images/ubuntu18.img

sudo rm -rf /var/lib/libvirt/images/ubuntu18.qcow2

sudo ls -la /var/lib/libvirt/images/