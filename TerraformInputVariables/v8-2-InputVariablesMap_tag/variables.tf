variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "us-east-1"
}
variable "ec2_ami_id" {
  description = "AMI ID for the instance to be launched"
  type        = string
  default     = "ami-08a52ddb321b32a8c"
}
variable "az" {
  description = "Availability Zone where the instance needs to launch"
  type        = string
  default     = "us-east-1a"
}
variable "ec2_instance_count" {
  description = "EC2 Instance Count"
  type        = number
  default     = 1
}
variable "ec2_instance_type" {
  description = "EC2 Instance Type"
  type        = list(string)
  default     = ["t3.micro", "t3.medium", "t3.large"]
}
variable "ec2_instance_tags" {
  description = "EC2 Instance Tags"
  type        = map(string)
  default = {
    "Name" = "Ec2 Web"
    "Tier" = "Web"
  }
}