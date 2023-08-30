resource "aws_instance" "my-ec2-vm" {
  ami               = "ami-01d025118d8e760db"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1c"
  tags = {
    Name = "Test Instance"
  }
  lifecycle {
    create_before_destroy = true
  }
}