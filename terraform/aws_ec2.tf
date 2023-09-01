resource "aws_instance" "apache-server" {
  ami                         = var.AMI_SELECT
  instance_type               = var.INSTA_TYPE
  availability_zone           = var.AV_ZONE
  associate_public_ip_address = true
  key_name                    = "apache-key-pair"
  security_groups             = ["${aws_security_group.apache_sg.id}"]
  tags = {
    Name = "apache-server"
  }
  subnet_id = aws_subnet.apache_subnet.id
} 