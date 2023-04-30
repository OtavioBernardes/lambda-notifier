aws = {
  region = "us-east-1"
}

environment = "development"

# Lambda configs
hello_world_lambda = {
  lambda_name    = "HelloWorld"
  lambda_handler = "index.handler"
  runtime        = "nodejs18.x"
}

## IAM configs
policy_lambda_name = "lambda_policy"
role_lambda_name   = "hellow_world_lambda_role"