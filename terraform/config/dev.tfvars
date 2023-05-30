aws = {
  region = "us-east-1"
}

environment = "dev"

# Lambdas configs
register_subscription_lambda = {
  lambda_name    = "register-subscription"
  lambda_handler = "index.handler"
  runtime        = "nodejs18.x"
  timeout        = 120
}

schedule_message_lambda = {
  lambda_name    = "schedule-message"
  lambda_handler = "index.handler"
  runtime        = "nodejs18.x"
  timeout        = 120
}

# IAM configs
iam = {
  policy_lambda_subscription = "policy_lambda_subscription"
  policy_lambda_schedule     = "policy_lambda_schedule"
  role_lambda_subscription   = "role_lambda_subscription"
  role_lambda_schedule       = "role_lambda_schedule"
  policy_scheduler           = "policy_scheduler"
  role_scheduler             = "role_scheduler"
}

# API Gateway configs
api_gateway = {
  name = "lambdas-notifier"
  resources = [
    {
      resource : "subscription",
      lambda : "register-subscription"
    },
    {
      resource : "schedule",
      lambda : "schedule-message"
    }
  ]
}

# SNS configs
sns = {
  topic_name = "notify"
}
