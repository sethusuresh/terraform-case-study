resource "aws_key_pair" "keypair_terraform" {
  key_name = "keypair_terraform"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCUPK3UD+G+WcXccsQI845uYHdcElbMS9ell5D4sofar0MgxEO8FW4JYP0q1Ja81jdT7TSWpidSAImqK+MoyCg2OsYO7mqm8kK2Rae5khHEnQpsFiIE8uyJS9Y+KHnzsKAjLaG3AFgToNUEk2sFyaKpCmxmtY2lQrbGMxwcDrp11vFNyhy/zpZb+sHhOYf1DJs23xWksW4NNesUS3NYoGwwk5VQCBH/KJn5F7HGtVLaSCLLF+x0Y45OLoHcmiMiH+T6zW9aXv13WVWm1x11lrTdSSRKJfIBkoeV8iFgeV440d4TvmuVGjLMT9wf9BFgA9c7mvwG9PsfeQYpYk+QqzB/30YfZ0tRVBud/r71eeMyGAwAvo7T4HA+1otONorUEHd4yGXW5ahcG6eKOKEZdUgHzoGxNCdiMJV8DWSmz3375l2pWmkFxViPbXaTNyT4dL5AP+CkM0jqd+/oD/SkkWab+p8N30rCCprMO/pXZYjO9twSlr4Knklg1H8D3GNtDh8= sethu@DESKTOP-0MRA2GT"
}

resource "aws_network_interface" "case-study-subnet-1-nw-interface" {
  subnet_id   = aws_subnet.case-study-public-subnet-1.id
  security_groups = [aws_security_group.case-study-sg.id]
  tags = {
    Name = "case-study-subnet-1-nw-interface"
  }
}

resource "aws_instance" "case-study-subnet-1-instance" {
  ami = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  key_name = aws_key_pair.keypair_terraform.key_name
  count = 1
  network_interface {
    network_interface_id = aws_network_interface.case-study-subnet-1-nw-interface.id
    device_index         = 0
  }
  user_data = "${file("install-apache2.sh")}"
  tags = {
    "Name" = "case-study-subnet-1-instance"
  }
  
}