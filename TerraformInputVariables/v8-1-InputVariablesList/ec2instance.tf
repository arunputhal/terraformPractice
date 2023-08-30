resource "aws_instance" "my-ec2-vm" {
  ami                    = var.ec2_ami_id
  availability_zone      = var.az
  instance_type          = var.ec2_instance_type[2]
  key_name               = "arunputhal"
  count                  = var.ec2_instance_count
  vpc_security_group_ids = [aws_security_group.vpc_ssh.id, aws_security_group.vpc_web.id]
  user_data              = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<h1> Welcome to My World</h1>"
    EOF
  tags = {
    Name = "Test Instance"
  }
}