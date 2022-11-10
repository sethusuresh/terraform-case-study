resource "aws_security_group" "case-study-sg" {
  name        = "case-study-sg"
  description = "Allow traffic to port 80"
  vpc_id      = aws_vpc.case-study-vpc.id

  tags = {
    Name = "case-study-sg"
  }
  
}