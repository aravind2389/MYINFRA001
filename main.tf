terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.26.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
  
  required_version = ">=0.14.3"
  
  backend "remote" {
    organization = "intellectonourown"

    workspaces {
      name = "MYINFRA001"
    }
  }
}

module "mvpc" {
  source        =   "../modules/vpc"
  vpc_cidr      =   "192.168.0.0/16"
  vpc_id        =   "${module.mvpc.vpc_id}"
  subnet_cidr   =   "192.168.1.0/24"
}

module "mec2" {
  source        =   "../modules/ec2"
  ec2_count     =   "1"
  ami_id        =   "ami-0b0af3577fe5e3532"
  inst_type     =   "t2.micro"
  subnet_id     =   "${module.mvpc.subnet_id}"
}