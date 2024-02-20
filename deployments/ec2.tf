terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.37.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "vmname" {
  ami               = var.ami
  instance_type     = var.instance_type
  availability_zone = "eu-west-1a"
  tags = {
    Name = "ec2_terraform.${count.index}"
  }
  count = 2
}


