locals {
  ports_in  = [22, 443]
  ports_out = [0]
}

resource "aws_security_group" "apache_sg" {
  name        = "apache_sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.apache_vpc.id
  dynamic "ingress" {
    for_each = toset(local.ports_in)
    content {
      description = "tls from VPC"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = toset(local.ports_out)
    content {
      description = "tls from VPC"
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "allow_tls"
  }
} 