variable "ec2_coount" {
  default       =       "1" 
}

variable "ami_id" { 
}

variable "inst_type" {
  type          =       "string"
  default       =       "t2.micro"    
}

variable "subnet_id" {
}