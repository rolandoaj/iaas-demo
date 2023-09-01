resource "aws_vpc" "apache_vpc" {
  cidr_block           = "172.16.0.0/16"
  enable_dns_hostnames = "true"
  enable_dns_support   = "true"
  instance_tenancy     = "default"
  tags = {
    Name = "apache_vpc"
  }
} 