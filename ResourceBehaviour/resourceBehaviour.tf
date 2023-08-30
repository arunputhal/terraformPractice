resource "aws_instance" "myec2-instance" {
  ami               = "ami-051f7e7f6c2f40dc1"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1b"
  tags = {
    "Name" = "web"
  }
}