provider "aws" {
  region = "eu-west-1"
}

resource "aws_eip" "ip" {
  domain = "vpc"
}

output "output_ip" {
  value = aws_eip.ip.public_ip
}