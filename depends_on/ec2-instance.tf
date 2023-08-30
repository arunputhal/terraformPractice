resource "aws_instance" "myec2instance" {
  ami                    = "ami-051f7e7f6c2f40dc1"
  instance_type          = "t2.micro"
  key_name               = "arunputhal"
  subnet_id              = aws_subnet.mypublicsubnet.id
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  user_data              = file("apache-install.sh")
}