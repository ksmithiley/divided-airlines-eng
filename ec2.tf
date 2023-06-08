variable "ec2" {
  description = "Name of the EC2 instance"
  type        = string
}

module "aws_airline_ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.0.0"

  name           = var.instance_name
  ami            = "ami-0c94855ba95c71c99"
  instance_type  = "t2.micro"
  subnet_id      = module.aws_airline_vpc.public_subnets[0]
  key_name       = "temp-key"
  security_group = ["sg-0123456789abcdef0"]
}
