resource "aws_resourcegroups_group" "rg" {
  name = "res-tf-useast1-rg-01"

  resource_query {
    query = <<JSON
{
  "ResourceTypeFilters": [
    "AWS::EC2::Instance", "AWS::EC2::Subnet", "AWS::EC2::VPC"
  ],
  "TagFilters": [
    {
      "Key": "created_by"
      "Values": ["deva"]
    },
    {
      "Key": "rg"
      "Values": ["res-tf-useast1-rg-01"]
    }
  ]
}
JSON
  }

  tags = {
    created_by = "deva"
    rg = "res-tf-useast1-rg-01"
  }
}

resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    created_by = "deva"
    name = "res-vpc-01"
    rg = "res-tf-useast1-rg-01"
  }
}

resource "aws_subnet" "sub1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    created_by = "deva"
    name = "res-vpc-01-sub-01"
    rg = "res-tf-useast1-rg-01"
  }
}