resource "ibm_is_instance" "vsi" {
  name              = "social-vsi"
  image             = var.image_id
  profile           = var.profile
  zone              = var.zone1
  vpc               = ibm_is_vpc.vpc.id
  primary_network_interface {
    subnet          = ibm_is_subnet.public_subnet.id
    security_groups = [ibm_is_security_group.vsi_sg.id]
  }
  keys              = [var.ssh_key_id]
  resource_group    = var.resource_group
}
