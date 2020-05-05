provider "aws" {
  region  = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-tf-7799"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-table"
  }
}

resource "aws_vpc" "my_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "terraformVpc"
    Environment = "${terraform.workspace}"
    Location = "Banglore"
 }
 
}

output "vpc_cidr" {
  value = "${aws_vpc.my_vpc.cidr_block}"
}
