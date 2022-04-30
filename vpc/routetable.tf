# Creating AWS Resrouce route table.
# This will be our public route table. 
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name  = "cp-${var.m_batch}-pub-rt"
    Batch = var.m_batch
  }
}

# Definig public routes. 
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default.id
}


# Associating the route table with subnets. 

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnet[0].id
  route_table_id = aws_route_table.public.id
}


# Creating AWS Resrouce route table.
# This will be our private route table. 
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name  = "cp-${var.m_batch}-pvt-rt"
    Batch = var.m_batch
  }
}

# Definig private route to the internet. 
resource "aws_route" "private" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.main.id
}

# Associating the route table with the subnet. 
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private_subnet[0].id
  route_table_id = aws_route_table.private.id
}
