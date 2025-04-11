variable "instance_type" {
  description = "Specifies the type of instance"
  type = string
  default = "t2.micro"
}

variable "ami" {
  description = "Specifies the AMI of EC2 instance"
  type = string
  default = ""
}

