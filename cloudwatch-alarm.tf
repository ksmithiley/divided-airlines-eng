variable "alarm" {
  description = "cloudwatch alarm"
  type        = string
}

module "aws_airline_cloudwatch_alarm" {
  source = "terraform-aws-modules/cloudwatch/aws"

  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = 3
  threshold          = 90
  alarm_description  = "CloudWatch alarm"
  actions_enabled    = true
  alarm_actions      = ["arn:aws:sns:us-west-2:123456789012:divided-airlines-eng"]
  namespace          = "AWS/EC2"
  metric_name        = "CPUUtilization"
  statistic          = "Average"
  dimensions = {
    InstanceId = module.aws_airline_ec2_instance.instance_id
  }
}
