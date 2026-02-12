terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.84.0"
    }
  }

  
  backend "s3" {
    bucket       = "kavya-daws82s"
    key          = "kavssy-cicd-tools"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true


  }
}


provider  "aws"{
    region = "us-east-1"
}