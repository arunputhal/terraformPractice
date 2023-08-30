resource "aws_vpc" "myvpc" {
  cidr_block           = "172.16.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name  = "MyTestVPC"
    Team  = "Cloudnauts"
    Email = "arunkumar.puthal@bigbasket.com"
  }
}
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name  = "MyIGW"
    Team  = "cloudnauts"
    Email = "arunkumar.puthal@bigbasket.com"
  }
}
resource "aws_subnet" "myprivatesubnet" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "172.16.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name  = "MyPrivateSubnet"
    Team  = "cloudnauts"
    Email = "arunkumar.puthal@bigbasket.com"
  }
}
resource "aws_subnet" "mypublicsubnet" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "172.16.2.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name  = "MyPublicSubnet"
    Team  = "cloudnauts"
    Email = "arunkumar.puthal@bigbasket.com"
  }
}
resource "aws_route_table" "mypublicroutetable" {
  vpc_id = aws_vpc.myvpc.id
}
resource "aws_route" "mypublicroute" {
  route_table_id         = aws_route_table.mypublicroutetable.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.myigw.id
}
resource "aws_route_table_association" "public_table_association" {
  route_table_id = aws_route_table.mypublicroutetable.id
  subnet_id      = aws_subnet.mypublicsubnet.id
}
resource "aws_security_group" "my_security_group" {
  name        = "my_default_security_group"
  description = "my default security group"
  vpc_id      = aws_vpc.myvpc.id
  ingress {
    description = "Allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all IPs and Ports Outbound"
    to_port     = 0
    from_port   = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}