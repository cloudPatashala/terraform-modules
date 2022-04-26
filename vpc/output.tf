output "out_vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "out_vpc_cidr" {
  value = aws_vpc.main_vpc.cidr_block
}


output "nat_gateway_ip" {
  value = aws_eip.nat_gateway.public_ip
}
