#!/bin/bash


sudo cloud-localds /var/lib/libvirt/images/cloud.img cloud.txt
sudo qemu-img convert -f qcow2 ubuntu2204/jammy-server-cloudimg-amd64.img  /var/lib/libvirt/images/ubuntu2204.img
sudo chmod +x virsh.sh
./virsh.sh