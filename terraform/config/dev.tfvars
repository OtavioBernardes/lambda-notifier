aws = {
  region = "us-east-1"
}

environment = "development"

# Lambdas configs
register_subscription_lambda = {
  lambda_name    = "register-subscription"
  lambda_handler = "index.handler"
  runtime        = "nodejs18.x"
}

schedule_message_lambda = {
  lambda_name    = "schedule-message"
  lambda_handler = "index.handler"
  runtime        = "nodejs18.x"
}

## IAM configs
policy_lambda_name        = "lambda_policy"
role_lambda_name          = "register_subscription_lambda_role"
role_schedule_lambda_name = "register_subscription_lambda_role"

## API Gateway configs
api_gateway = {
  name                  = "lambdas-notifier"
  resource_subscription = "subscription",
  resource_schedule     = "schedule"
}

# SNS configs
sns = {
  topic_name = "notify"
}
