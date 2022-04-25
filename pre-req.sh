#Install the needfull packages.
sudo apt install cloud-image-utils virtinst -y

#Make directory to download and cloud-img files
mkdir ubuntu2004

#Get the cloud image from https://cloud-images.ubuntu.com/
cd ubuntu2004
wget https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img

# Crete the image file ot iso file as required with user input from the text file.
cd ../
sudo cloud-localds /var/lib/libvirt/images/ubuntu2004.img cloud.txt

# Converting?
sudo qemu-img convert -f qcow2 ubuntu2004/focal-server-cloudimg-amd64.img /var/lib/libvirt/images/ubuntu2004.img

#Creating the virtual machine with script using virsh cli commands
sudo chmod +x virsh.sh
./virsh.sh

#Stop the machine
sudo virsh destroy ubuntu2004

# To clean including the name spaces
sudo virsh undefine ubuntu2004

#Removce the boot image
sudo rm -rf /var/lib/libvirt/images/ubuntu2004.img

#Remove the disk image
sudo rm -rf /var/lib/libvirt/images/ubuntu2004.img





