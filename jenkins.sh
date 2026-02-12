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



curl -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum install fontconfig java-17-openjdk jenkins -y
yum install jenkins -y
ystemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins