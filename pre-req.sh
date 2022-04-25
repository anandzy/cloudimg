#Install the needfull packages.
sudo apt install cloud-image-utils virtinst -y

#Make directory to download and cloud-img files
mkdir ubuntu2204

#Get the cloud image from https://cloud-images.ubuntu.com/
cd ubuntu18
wget https://cloud-images.ubuntu.com/jammy/jammy-server-cloudimg-amd64.img

# Crete the image file ot iso file as required with user input from the text file.
cd ../
sudo cloud-localds /var/lib/libvirt/images/cloud.img cloud.txt

# Converting?
sudo qemu-img convert -f qcow2 ubuntu18/bionic-server-cloudimg-amd64.img /var/lib/libvirt/images/ubuntu18.img

#Creating the virtual machine with script using virsh cli commands
sudo chmod +x virsh.sh
./virsh.sh

#Stop the machine
sudo virsh destroy ubuntu2204

# To clean including the name spaces
sudo virsh undefine ubuntu2204

#Removce the boot image
sudo rm -rf /var/lib/libvirt/images/clubuntu2204.img

#Remove the disk image
sudo rm -rf /var/lib/libvirt/images/ubuntu2204.img





