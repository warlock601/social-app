variable "instance_type_value" {
  description = "Specifies the type of instance"
  type = string
  default = "t2.micro"
}

variable "ami_value" {
  description = "Specifies the AMI of EC2 instance"
  type = string
  default = ""
}

