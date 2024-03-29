#!/bin/bash

sudo ls -la /var/lib/libvirt/images/

sudo virt-install \
 --name ubuntu18 \
 --memory 4024 \
 --disk /var/lib/libvirt/images/ubuntu18.qcow2,device=disk,bus=virtio,size=50 \
 --disk /var/lib/libvirt/images/ubuntu18c.img,device=cdrom,size=50 \
 --os-type linux \
 --os-variant ubuntu18.04 \
 --virt-type kvm \
 --graphics none \
 --network network=default,model=virtio \
 --import \
 --check path_in_use=off \
 --check disk_size=off

 
