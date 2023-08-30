resource "aws_instance" "myec2-vm" {
  ami           = "ami-08a52ddb321b32a8c"
  key_name      = "arunputhal"
  instance_type = "t3.micro"
  tags = {
    Name   = "test-instance"
    Team   = "cloudnauts"
    Email  = "cloudnauts@bigbasket.com"
    Moduke = "FE"
  }
}