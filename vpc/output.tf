output "out_vpc_id" {
  value = aws_vpc.cpb00_main_vpc.id
}

output "out_vpc_cidr" {
  value = aws_vpc.cpb00_main_vpc.cidr_block
}
