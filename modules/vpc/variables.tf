variable "region" {
  type      =       "string"
  default   =       "us-east-1" 
}

variable "vpc_cidr" {
  type      =       "string"
  default   =       "10.0.0.0/16" 
}

variable "tenancy" {
  type      =       "string"
  default   =       "default" 
}

variable "vpc_id" {
}

variable "subnet_cidr" {
   type     =       "string"
   default  =       "10.0.1.0/24"  
}

variable "igw_id" {
}

variable "subnet_id" {
}

variable "rtb_id" {
}
