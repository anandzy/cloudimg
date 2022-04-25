#!/bin/bash
#Install the needfull packages.
sudo apt install cloud-image-utils virtinst -y
#Make directory to download and cloud-img files
mkdir ubuntu18
cp cloud.txt /var/lib/libvirt/images/
#Get the cloud image from https://cloud-images.ubuntu.com/
cd ubuntu18
#Download the cloud image
wget https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img
#cloud-localds creates a disk-image with user-data and/or meta-data for cloud-init(1).  user-data can contain everything which is supported by cloud-init(1)
cd ../
sudo cloud-localds /var/lib/libvirt/images/cloud.img cloud.txt
#qemu-img - QEMU disk image utility
sudo qemu-img convert -f qcow2 ubuntu18/bionic-server-cloudimg-amd64.img /var/lib/libvirt/images/ubuntu18.img
#Excuting virsh commands to create VM
sudo chmod +x virsh.sh
./virsh.sh
