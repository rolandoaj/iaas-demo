resource "aws_eip" "apache_eip" {
  instance = aws_instance.apache-server.id
  vpc      = "true"
} 