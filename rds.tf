variable "DAE-RDS" {
  description = "RDS"
  type        = string
}

module "aws_airline_rds_instance" {
  source = "terraform-aws-modules/rds/aws"

  db_instance_identifier = var.db_instance_name
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  allocated_storage      = 10
  username               = "ksmithiley"
  password               = "DividedAirlines1!"
  vpc_security_group_ids = ["sg-0123456789abcdef0"]
  db_subnet_group_name   = module.aws_airline_vpc.db_subnet_group_name
}
