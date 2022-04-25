#!/bin/bash


sudo cloud-localds /var/lib/libvirt/images/ubuntu2004.img cloud.txt
sudo qemu-img convert -f qcow2 ubuntu2004/focal-server-cloudimg-amd64.img  /var/lib/libvirt/images/ubuntu2004.img
sudo chmod +x virsh.sh
./virsh.sh