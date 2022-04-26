# To allocate and Elastic IP which will be used for NAT Gateway.
resource "aws_eip" "nat_gateway" {
  vpc = true
}

# Creating Nat Gateway on public Subnet.
# We are having our setup in only 1 AZ so we are using the count.index = 0. 

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.public_subnet[0].id
  tags = {
    "Name" = "cp-${var.m_batch}-nat-gateway"
  }
}

