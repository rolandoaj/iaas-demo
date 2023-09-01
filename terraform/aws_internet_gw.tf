resource "aws_internet_gateway" "apache_gw" {
  vpc_id = aws_vpc.apache_vpc.id
  tags = {
    Name = "apache_gw"
  }
} 