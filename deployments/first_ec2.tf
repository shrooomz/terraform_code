provider "aws" {
  region     = "eu-north-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "vmname" {
    ami = "ami-00c39f71452c08778"
    instance_type = "t2.micro"
    tags {
      Name = "ec2_name"
    }
}
