resource "aws_route_table_association" "case-study-route-table-association-subnet-1" {
  subnet_id      = aws_subnet.case-study-public-subnet-1.id
  route_table_id = aws_route_table.case-study-route-table.id
}

resource "aws_route_table_association" "case-study-route-table-association-subnet-2" {
  subnet_id      = aws_subnet.case-study-public-subnet-2.id
  route_table_id = aws_route_table.case-study-route-table.id
}