resource "aws_instance" "mylinuxvm" {
  ami           = "ami-051f7e7f6c2f40dc1"
  instance_type = "t2.micro"
  key_name      = "arunputhal"
  count         = 3
  tags = {
    Name = "mylinuxvm-${count.index}"
  }
}