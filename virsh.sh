sudo virt-install \
 --name ubuntu2004 \
 --memory 4024 \
 --disk /var/lib/libvirt/images/ubuntu2004.img,device=disk,bus=virtio \
 --disk /var/lib/libvirt/images/ubuntu2004.img,device=cdrom \
 --os-type linux \
 --os-variant ubuntu20.04 \
 --virt-type kvm \
 --graphics none \
 --network network=default,model=virtio \
 #--import
 #--check path_in_use=off