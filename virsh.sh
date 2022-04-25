sudo virt-install \
 --name ubuntu18 \
 --memory 4024 \
 --disk /var/lib/libvirt/images/ubuntu2204.img,device=disk,bus=virtio \
 --disk /var/lib/libvirt/images/ubuntu2204.img,device=cdrom \
 --os-type linux \
 --os-variant ubuntu22.04 \
 --virt-type kvm \
 --graphics none \
 --network network=default,model=virtio \
 #--import
 #--check path_in_use=off