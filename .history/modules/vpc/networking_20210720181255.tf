provider "aws" {
  region        =   "${var.region}"
}

resource "aws_vpc" "vpc001" {
  cidr_block                =      "${var.cidr}"
  insinstance_tenancy       =      "${var.tenancy}" 
  enable_dns_hostnames      =      "true"
  enable_enable_dns_support =      "true"
  tags = {
      "Name"    =   "MYVPC"
  }  
}

resource "aws_subnet" "subnet001" {
  vpc_id                   =       "${var.vpc_id}"
  cidr_block               =       "${var.subnet_cidr}"
  map_public_ip_on_launch  =       "true"
  tags = {
    "Name"    =   "MYPUBSUBNET"
  }    
}

resource "aws_internet_gateway" "igw001" {
  vpc_id                   =        "${var.vpc_id}"
  tags = {
    "Name"    =   "MYIGW"
  } 
}

resource "aws_route_table" "rtb001" {
  vpc_id                    =        "${var.vpc_id}"
  route {
    cidr_block            =     "0.0.0.0/0"
    gateway_id            =     "${var.igw_id}"  
  } 
  tags = {
    "Name"    =    "MYRTB" 
  }
}

resource "aws_route_table_association" "my" {
  
}