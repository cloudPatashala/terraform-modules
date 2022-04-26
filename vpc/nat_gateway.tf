resource "aws_eip" "nat_gateway" {
  vpc = true
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.aws_subnet.public_subnet[count.index].id
  tags = {
    "Name" = "cp-${var.m_batch}-nat-gateway"
  }
}

