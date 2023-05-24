aws = {
  region = "us-east-1"
}

environment = "development"

# Lambda configs
register_subscription_lambda = {
  lambda_name    = "register-subscription"
  lambda_handler = "index.handler"
  runtime        = "nodejs18.x"
}

## IAM configs
policy_lambda_name = "lambda_policy"
role_lambda_name   = "register_subscription_lambda_role"

## API Gateway configs
api_gateway_name = "lambdas-notifier"
resource_path = "notify"
