resource "aws_internet_gateway" "case-study-igw" {
  vpc_id = aws_vpc.case-study-vpc.id
  tags = {
    Name = "case-study-igw"
  }
}