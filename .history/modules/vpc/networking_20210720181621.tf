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
  vpc_id                    =     "${var.vpc_id}"
  route {
    cidr_block              =     "0.0.0.0/0"
    gateway_id              =     "${var.igw_id}"  
  } 
  tags = {
    "Name"    =    "MYRTB" 
  }
}

resource "aws_route_table_association" "rtbasc001" {
  subnet_id                 =     "${var.subnet_id}" 
  routroute_table_id        =     "${var.rtb_id}"   
}

resource "aws_security_group" "securitygp001" {
   description    = "allow TLS inbound traffic"
   vpc_id          = aws_vpc.myvpc01.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "jenkins"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MYSECURITYGP"
  }
}