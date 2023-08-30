variable "sg_ports" {
  type        = list(number)
  description = "List of ingress ports"
  default     = [80, 443, 22]
}
variable "region" {
  default = "us-east-1"
}