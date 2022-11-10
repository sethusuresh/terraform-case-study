resource "aws_subnet" "case-study-public-subnet-2" {
  vpc_id     = aws_vpc.case-study-vpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "case-study-public-subnet-2"
  }
}