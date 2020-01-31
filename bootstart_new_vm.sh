#!/bin/bash


sudo cloud-localds /var/lib/libvirt/images/cloud.img cloud.txt
sudo qemu-img convert -f qcow2 ubuntu18/bionic-server-cloudimg-amd64.img /var/lib/libvirt/images/U18.04.img
sudo chmod +x virsh.sh
./virsh.sh
