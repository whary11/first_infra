# Definir el proveedor
provider "aws" {
  region = "us-east-2"
}

# Crear VPCs
resource "aws_vpc" "vpc_1" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "vpc infra based in code_tf"
  }
}

# Crear subnets
resource "aws_subnet" "subnet_1" {
    vpc_id = "${aws_vpc.vpc_1.id}"
    cidr_block = "10.0.1.0/24"
    tags = {
        Name = "subnet infra based in code_tf"
    }
}

