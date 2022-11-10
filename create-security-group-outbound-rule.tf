resource "aws_security_group_rule" "case-study-security-group-outbound-rule" {

  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  security_group_id = aws_security_group.case-study-sg.id
  cidr_blocks       = ["0.0.0.0/0"]
  
}