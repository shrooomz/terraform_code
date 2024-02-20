provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "remote-exec" {
  ami           = "ami-08e592fbb0f535224"
  instance_type = "t2.micro"
  key_name      = "remote-exec"

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./remote-exec.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y nginx",
      "sudo systemctl start nginx"
    ]
  }
}