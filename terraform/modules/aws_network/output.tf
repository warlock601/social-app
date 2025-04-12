output "public_subnet_id" {
  description = "Outputs value of public_subnet"
  value = aws_subnet.public_subnet.id
}


output "vpc_id" {
  description = "Outputs value of VPC id"
  value = aws_vpc.social_vpc.id
}