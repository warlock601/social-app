variable "cidr_block" {
  description = "To specify the value of CIDR block for VPC"
}

variable "zone1" {
  description = "To specify the value of AZ"
  type = string
  default = "us-south-1"
}

variable "resource_group" {
  description = "To specify the value of Resource Group"
  type = string
  default = "Default"
}