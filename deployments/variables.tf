variable "vpn_ip" {
  default = "116.50.30.50/32"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  default = "ami-08e592fbb0f535224"
  type    = string
}

