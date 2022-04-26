resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name  = "cp-${var.m_batch}-igw"
    Batch = var.m_batch
  }
}
