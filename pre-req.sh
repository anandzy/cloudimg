#Install the needfull packages.
sudo apt install cloud-image-utils virtinst -y

#Make directory to download and cloud-img files
mkdir ubuntu18

#Get the cloud image from https://cloud-images.ubuntu.com/
wget https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img

# Crete the image file ot iso file as required with user input from the text file.
sudo cloud-localds /var/lib/libvirt/images/cloud.img cloud.txt

# Converting?
sudo qemu-img convert -f qcow2 bionic-server-cloudimg-amd64.img /var/lib/libvirt/images/U18.04.img

