module "aws_compute" {
  source            = "../modules/aws_compute"
  
  instance_type     = "t2.micro"
  ami               = "ami-099eeb58169040255"
}


module "aws_network" {
  source            = "../modules/aws_network"

  cidr_block        = "10.0.0.0/16"
  zone1             = "us-east-1a"
  subnet_cidr_block = "10.0.0.0/19" 

}