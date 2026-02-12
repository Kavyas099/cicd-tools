#!/bin/bash

#resize disk from 20GB to 50GB

sudo growpart /dev/nvme0n1 4
 sudo pvresize /dev/nvme0n1p4
sudo vgdisplay RootVG
 sudo lvextend -l +100%FREE /dev/RootVG/rootVol
sudo xfs_growfs /



xfs_growfs /home
xfs_growfs /var/tmp
xfs_growfs /var

yum install java-17-openjdk -y

yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum -y install terraform
dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y
yum install zip -y

# docker
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user

curl -O curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.33.0/2025-05-01/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv kubectl /usr/local/bin/kubectl

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

dnf install maven -y