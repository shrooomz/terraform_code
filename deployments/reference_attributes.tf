provider "aws" {
  region = "eu-west-1"
}

resource "aws_eip" "lb" {
  domain   = "vpc"
}

resource "aws_security_group" "allow_tls" {
  name   = "terraform-security-group"
  vpc_id = "vpc-0dc7af8718a76c90e"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
