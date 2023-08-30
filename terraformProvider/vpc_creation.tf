resource "aws_vpc" "myvpc" {
  cidr_block = "172.16.0.0/16"
  tags = {
    Name = "myvpc"
  }
}