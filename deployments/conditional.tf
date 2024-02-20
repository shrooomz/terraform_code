provider "aws" {
  region = "eu-west-1"
}

variable "istest" {}

resource "aws_instance" "dev" {
  ami               = var.ami
  instance_type     = var.instance_type
  availability_zone = "eu-west-1a"
  tags = {
    Name = "dev"
  }
  count = var.istest == true ? 3 : 0
}

resource "aws_instance" "prod" {
  ami               = var.ami
  instance_type     = var.instance_type
  availability_zone = "eu-west-1a"
  tags = {
    Name = "prod"
  }
  count = var.istest == false ? 1 : 0
}