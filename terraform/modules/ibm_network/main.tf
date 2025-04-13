resource "ibm_is_vpc" "vpc" {
  name = "social-vpc"
}


resource "ibm_is_public_gateway" "public_gateway" {
  name           = "social-igw"
  vpc            = ibm_is_vpc.vpc.id
  zone           = var.zone1
  resource_group = var.resource_group
}


resource "ibm_is_subnet" "public_subnet" {
  name                     = "social-public-subnet"
  vpc                      = ibm_is_vpc.vpc.id
  zone                     = var.zone
  ipv4_cidr_block          = var.cidr_block
  public_gateway           = ibm_is_public_gateway.public_gateway.id
  resource_group           = var.resource_group
}


resource "ibm_is_security_group" "web_sg" {
  name = "social-sg"
  vpc  = ibm_is_vpc.vpc.id
}

resource "ibm_is_security_group_rule" "allow_ssh" {
  group     = ibm_is_security_group.web_sg.id
  direction = "inbound"
  protocol  = "tcp"
  port_min  = 22
  port_max  = 22
  remote    = "0.0.0.0/0"
}

resource "ibm_is_security_group_rule" "allow_http" {
  group     = ibm_is_security_group.web_sg.id
  direction = "inbound"
  protocol  = "tcp"
  port_min  = 80
  port_max  = 80
  remote    = "0.0.0.0/0"
}

resource "ibm_is_security_group_rule" "allow_outbound" {
  group     = ibm_is_security_group.web_sg.id
  direction = "outbound"
  protocol  = "all"
}