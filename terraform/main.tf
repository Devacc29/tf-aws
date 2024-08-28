terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    region = "us-east-1"
    key = "terraform.tfstate"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_resourcegroups_group" "rg" {
  name = "aws-tf-useast-rg-01"

  resource_query {
    query = <<JSON
{
  "ResourceTypeFilters": [
    "AWS::EC2::Instance"
  ],
  "TagFilters": [
    {
      "Key": "created_by",
      "Values": ["deva"]
    }
  ]
}
JSON
  }

  tags = {
    created_by = "deva"
  }
}

resource "aws_vpc" "vpc" {
  arn = "res-vpc-01"
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    created_by = "deva"
  }
}

resource "aws_subnet" "sub1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    created_by = "deva"
  }
}