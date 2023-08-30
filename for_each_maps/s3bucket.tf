resource "aws_s3_bucket" "mys3bucket" {
  for_each = {
    "dev"     = "dapp-bucket"
    "qa"      = "qapp-bucket"
    "hqa"     = "happ-bucket"
    "uat"     = "uapp-bucket"
    "staging" = "stageapp-bucket"
    "prod"    = "prodapp-bucket"
  }
  bucket = "${each.key}-${each.value}"
  tags = {
    Name        = "${each.key}-${each.value}"
    Environment = "${each.key}"
  }
}