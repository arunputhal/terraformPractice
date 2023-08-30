resource "aws_eip" "my-eip" {
  domain = "vpc"
}
resource "aws_security_group" "my-sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.my-eip.public_ip}/32"]
  }
  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.my-eip.public_ip}/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}