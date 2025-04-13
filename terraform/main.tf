module "aws_compute" {
  source            = "./modules/aws_compute"
  
  instance_type_value    = "t2.micro"
  ami_value              = "ami-099eeb58169040255"
}


module "aws_network" {
  source            = "./modules/aws_network"

  cidr_block        = "10.0.0.0/16"
  zone1             = "us-east-1a"
  subnet_cidr_block = "10.0.0.0/19" 

}



module "ibm_compute" {
  source = "./modules/ibm_compute"
  image_id= ""
  profile = ""
  zone1 = "us-south-1"
  ssh_key_id = ""
  
}



module "ibm_network" {
  source = "./modules/ibm_network"

  zone1 = "us-south-1"
  cidr_block = ""
  resource_group = ""
}