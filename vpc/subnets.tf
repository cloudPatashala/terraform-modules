# Creating Subnets. 
resource "aws_subnet" "private_subnet" {
  count = length(var.m_private_subnet_cidr_blocks)

  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.m_private_subnet_cidr_blocks[count.index]
  availability_zone = var.m_availability_zones[count.index]

  tags = {
    Name = "cp-${var.m_batch}-pvt-subnet"
  }
}

# Creating Subnet2
resource "aws_subnet" "public_subnet" {
  count = length(var.m_public_subnet_cidr_blocks)

  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.m_public_subnet_cidr_blocks[count.index]
  availability_zone       = var.m_availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "cp-${var.m_batch}-pub-subnet"
  }
}
