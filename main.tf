terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
#provider "aws" {
#  region     = "us-east-1"
#  access_key = "pasteaccesskeyhere"
#  secret_key = "pastesecretkeyhere"
#}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

# Use the .csv file as input into creating VMs
locals {
  instances = csvdecode(file("./demo.csv"))
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "vm" {
  for_each = { for inst in local.instances : inst.VM_Name => inst }

#  ami           = data.aws_ami.ubuntu.id
#  cpu_core_count = each.value.vCPU
  ami           = each.value.ami
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
