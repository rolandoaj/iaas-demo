resource "aws_subnet" "apache_subnet" {
  vpc_id            = aws_vpc.apache_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.apache_vpc.cidr_block, 3, 1)
  availability_zone = var.AV_ZONE
  tags = {
    Name = "apache_subnet"
  }
} 