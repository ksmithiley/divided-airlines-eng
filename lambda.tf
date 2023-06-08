variable "lambda_test" {
  description = "Divided Airlines Lambda Function Test"
  type        = string
}

module "aws_airline_lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name        = var.function_name
  description          = "Divided Airlines Lambda Function Test"
  runtime              = "python3.9"
  handler              = "lambda_function.lambda_handler"
  source_code_filename = "lambda_function.zip"
  memory_size          = 256
  timeout              = 10
  environment_variables = {
    AWS_REGION             = "us-west-2"
    AWS_ACCESS_KEY_ID      = "AKIAIOSFODNN7DAENG"
    AWS_SECRET_ACCESS_KEY  = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYDiVIdEDAIR"
  }
}
