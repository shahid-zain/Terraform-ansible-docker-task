provider "aws" {
  region = var.AWS_REGION
}

resource "aws_vpc" "shahid-vpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags = {
        Name = "shahid-vpc"
    }
}

resource "aws_subnet" "shahid-public-subnet" {
    vpc_id = aws_vpc.shahid-vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-west-1a"
    tags = {
        Name = "shahid-public-subnet"
    }
}

# Internet Gateway
resource "aws_internet_gateway" "shahid-gw" {
    vpc_id = aws_vpc.shahid-vpc.id
    tags = {
        Name = "shahid-gw"
    }
} 

# Route Tables
resource "aws_route_table" "shahid-rt" {
    vpc_id = aws_vpc.shahid-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.shahid-gw.id
    }
    tags = {
        Name = "shahid-rt"
    }
}

# For Route associations public
resource "aws_route_table_association" "shahid-rt-as" {
    subnet_id = aws_subnet.shahid-public-subnet.id
    route_table_id = aws_route_table.shahid-rt.id
}
