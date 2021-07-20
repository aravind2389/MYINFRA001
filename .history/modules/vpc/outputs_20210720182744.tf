output "vpc_id" {
  value         =   "${aws_vpc.vpc001.id}"
}

output "igw_id" {
  value         =   "${aws_internet_gateway.igw001.id}" 
}

output "subnet_id" {
  value         =   "${aws_subnet.subnet001.id}" 
}

output "rtb_id" {
  value         =   "${aws_route_table.rtb001.id}" 
}