resource "aws_eip" "my-eip" {
  instance   = aws_instance.myec2instance.id
  depends_on = [aws_internet_gateway.myigw]
}