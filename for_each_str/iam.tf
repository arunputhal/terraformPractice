resource "aws_iam_user" "myiamuser" {
  for_each = toset(["Jack", "James", "Madhu", "Dave"])
  name     = each.value
}