resource "aws_route_table" "apache_rtb" {
  vpc_id = aws_vpc.apache_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.apache_gw.id
  }

  tags = {
    Name = "apache_rtb"
  }
}

resource "aws_route_table_association" "apache_rtb_as" {
  subnet_id      = aws_subnet.apache_subnet.id
  route_table_id = aws_route_table.apache_rtb.id
} 