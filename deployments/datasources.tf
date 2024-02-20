provider "aws" {
  region = "eu-west-1"
}

data "aws_ami" "ami" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "vmname" {
  ami               = data.aws_ami.ami.id
  instance_type     = var.instance_type
  availability_zone = "eu-west-1a"
}

