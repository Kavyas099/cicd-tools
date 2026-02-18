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


# Install required tools
sudo dnf install -y curl java-17-openjdk fontconfig

# Add Jenkins repository
sudo curl -L https://pkg.jenkins.io/redhat-stable/jenkins.repo \
-o /etc/yum.repos.d/jenkins.repo

# Import Jenkins key
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Install Jenkins
sudo dnf install -y jenkins

# Reload systemd
sudo systemctl daemon-reload

# Enable & Start Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
