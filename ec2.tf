resource "aws_instance" "my_ec2" {
  ami           = "ami-01d025118d8e760db"
  instance_type = "t2.micro"
  key_name      = "arunk"
  tags = {
    Name        = "Test"
    Environment = "QA"
  }
  vpc_security_group_ids = [aws_security_group.webserver_sg.id]
}
