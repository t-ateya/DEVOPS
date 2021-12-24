provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "~/.aws/credentials"
  version                 = "~> 3.37"
}

terraform {
  required_version = ">= 0.12"
  backend "s3" {
    bucket                  = "mastering-terraform"
    key                     = "terraform.tfstate"
    region                  = "us-east-1"
    encrypt                 = true
    dynamodb_table          = "javahome-tf"
    shared_credentials_file = "~/.aws/credentials"
  }
}

resource "aws_vpc" "my_vpc" {
  count            = terraform.workspace == "dev" ? 0 : 1
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name        = "JavaHomeVpc"
    Environment = terraform.workspace
    Location    = "California"
  }
}

# output "vpc_cidr" {
#   value       = "${aws_vpc.my_vpc.cidr_block}"
#   sensitive   = false
#   description = "Ouput the vpc id"
#   depends_on  = []
# }
