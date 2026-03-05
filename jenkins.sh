 #!/bin/bash
 sudo growpart /dev/nvme0n1 4

 sudo lvextend -L +10G /dev/mapper/RootVG-homeVol
 sudo lvextend -L +10G /dev/mapper/RootVG-varVol
 sudo lvextend -l +100%FREE /dev/mapper/RootVG-varTmpVol

 sudo xfs_growfs /home
 sudo xfs_growfs /var/tmp
 sudo xfs_growfs /var


sudo curl -L -o /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum install fontconfig java-17-openjdk jenkins -y

sudo yum install -y jenkins
sudo systemctl daemon-reload
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins