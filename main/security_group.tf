resource "aws_security_group" "webserver_sg" {
  name        = "webserver-sg"
  description = "Ingress for webserver"
  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = "0"
    protocol    = "-1"
    to_port     = "0"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "WebserverSG"
  }
}
