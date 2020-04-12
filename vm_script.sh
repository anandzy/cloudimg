#!/bin/bash

"sudo apt-get update && apt-get install -y apt-transport-https ca-certificates curl software-properties-common gnupg2"

### Add Docker’s official GPG key
"sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -"

### Add Docker apt repository.
'sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"'

## Install Docker CE.
"sudo apt-get update && apt-get install -y containerd.io=1.2.13-1 docker-ce=5:19.03.8~3-0~ubuntu-$(lsb_release -cs) docker-ce-cli=5:19.03.8~3-0~ubuntu-$(lsb_release -cs)"
# Setup daemon.
'sudo cat > /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF'

"sudo mkdir -p /etc/systemd/system/docker.service.d"

# Restart docker.
"sudo systemctl daemon-reload"
"sudo systemctl restart docker"



 - "curl -fsSL https://get.docker.com -o get-docker.sh; sh get-docker.sh"
 - "sudo usermod -aG docker ubuntu"
 - "sudo systemctl restart docker"
 - curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
 - cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
   deb https://apt.kubernetes.io/ kubernetes-xenial main
   EOF
 - sudo apt-get update
 - sudo apt-get install -y kubelet kubeadm kubectl
 - sudo apt-mark hold kubelet kubeadm kubectl
 - sudo kubeadm init --pod-network-cidr=10.244.0.0/16
 - mkdir -p $HOME/.kube
 - sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
 - sudo chown $(id -u):$(id -g) $HOME/.kube/config