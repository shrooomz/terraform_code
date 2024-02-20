variable "ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [8080, 8081]
}

resource "aws_security_group" "sg" {
  name = "sample"
  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}