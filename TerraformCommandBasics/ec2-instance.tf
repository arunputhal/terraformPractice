terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "ec2demo" {
  ami           = "ami-08a52ddb321b32a8c"
  instance_type = "t2.micro"
}