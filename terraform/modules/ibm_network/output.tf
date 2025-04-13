output "public_subnet_id" {
  description = "Outputs value of public_subnet"
  value = ibm_is_subnet.public_subnet.id
}


output "vpc_id" {
  description = "Outputs value of VPC id"
  value = ibm_is_vpc.vpc.id
}

