resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    created_by = "deva"
    name = "res-vpc-01"
  }
}

resource "aws_subnet" "sub1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    created_by = "deva"
    name = "res-vpc-01-sub-01"
  }
}