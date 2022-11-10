resource "aws_network_interface" "case-study-subnet-2-nw-interface" {
  subnet_id   = aws_subnet.case-study-public-subnet-2.id
  security_groups = [aws_security_group.case-study-sg.id]
  tags = {
    Name = "case-study-subnet-2-nw-interface"
  }
}

resource "aws_instance" "case-study-subnet-2-instance" {
  ami = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  key_name = aws_key_pair.keypair_terraform.key_name
  count = 1
  network_interface {
    network_interface_id = aws_network_interface.case-study-subnet-2-nw-interface.id
    device_index         = 0
  }
  user_data = "${file("install-apache2.sh")}"
  tags = {
    "Name" = "case-study-subnet-2-instance"
  }
  
}