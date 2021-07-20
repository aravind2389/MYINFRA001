resource "aws_instance" "webserver001" {
  count                     =       "${var.ec2_count}" 
  ami                       =       "${var.ami_id}"
  instance_type             =       "${var.inst_type}"
  subnet_id                 =       "${var.subnet_id}" 
  tags = {
    "Name" = "WEBSERVER"
  }
}