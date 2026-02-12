resource "aws_instance" "jenkins_master" {
    
  ami           = data.aws_ami.kavya.id
  
  instance_type = "t3.micro"
  
  root_block_device {
    volume_size = 50
    volume_type = "gp3"
  }
 
  user_data = file("${path.module}/jenkins.sh")
  

  vpc_security_group_ids = [aws_security_group.jenkins_master_sg_id.id]

  tags = {
    Name = "jenkins-master"
  }
}

resource "aws_instance" "jenkins_agent" {
  ami           = data.aws_ami.kavya.id
  instance_type = "t3.micro"
   
  root_block_device {
    volume_size = 50
    volume_type = "gp3"
  }

  user_data = file("${path.module}/jenkins-agent.sh")

  vpc_security_group_ids = [aws_security_group.jenkins_master_sg_id.id]

  tags = {
    Name = "jenkins-agent"
  }
}


resource "aws_security_group" "jenkins_master_sg_id" {
    name = "jenkins-master-sg"

    ingress {
        from_port = 22
        to_port =22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }


    ingress {
        from_port = 8080
        to_port =8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol= "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "sg_tags"
    }
}

resource "aws_security_group" "jenkins_agent_sg" {
  name = "jenkins-agent-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


    ingress {
        from_port = 8080
        to_port =8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "jenkins_agent" {
  value = aws_instance.jenkins_master.public_ip
}

output "jenkins_master" {
  value = aws_instance.jenkins_agent.public_ip
}
