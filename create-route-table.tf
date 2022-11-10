resource "aws_route_table" "case-study-route-table" {
  vpc_id = aws_vpc.case-study-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.case-study-igw.id
  }
  tags = {
    Name = "case-study-route-table"
  }
}