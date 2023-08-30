resource "aws_instance" "my-ec2-vm" {
  ami = "ami-01d025118d8e760db"
  instance_type = "t3.micro"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Test Instance"
  }
}
output "arn" {
  value = aws_instance.my-ec2-vm
}
