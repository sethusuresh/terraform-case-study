resource "aws_security_group_rule" "case-study-security-group-inbound-rule" {

  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.case-study-sg.id
  cidr_blocks       = ["0.0.0.0/0"]
  
}