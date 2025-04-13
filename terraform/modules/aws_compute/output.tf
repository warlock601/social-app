output "name" {
  description = "Outputs the Public IP of EC2 instance created"
  value = aws_instance.instance1.public_ip
}