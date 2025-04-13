
resource "aws_vpc" "social_vpc" {
  cidr_block = var.cidr_block

  enable_dns_support = true
  enable_dns_hostnames = true
}


resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.social_vpc.id
  availability_zone = var.zone1
  map_public_ip_on_launch = true
  cidr_block = var.subnet_cidr_block
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.social_vpc.id
}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.social_vpc.id
  route = {
    cidr_block = "0.0.0.0/0"                             //All outbound traffic to anywhere (0.0.0.0/0), will be sent through this internet gateway
    gateway_id = aws_internet_gateway.igw.id
  }
}


resource "aws_route_table_association" "rt_ass" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public.id
}


resource "aws_security_group" "socail_sg" {
  name        = "web-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.social_vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"                  //"-1" is a value in AWS thatv means "all protocols", this rule allows all outbound traffic (TCP, UPD, ICMP etc)
    cidr_blocks = ["0.0.0.0/0"]
  }
}
