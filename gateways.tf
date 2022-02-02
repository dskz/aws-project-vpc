resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.project1.id
  tags = locals.common_tags
}

resource "aws_eip" "nat" {
  vpc = true
  tags = locals.common_tags
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public1.id
  tags = locals.common_tags
}
