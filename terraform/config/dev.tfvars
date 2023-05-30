aws = {
  region = "us-east-1"
}

environment = "dev"

# SNS configs
sns = {
  topic_name = "notify"
}

# Lambdas configs
register_subscription_lambda = {
  name    = "register-subscription"
  handler = "index.handler"
  runtime = "nodejs18.x"
  timeout = 120
}

schedule_message_lambda = {
  name    = "schedule-message"
  handler = "index.handler"
  runtime = "nodejs18.x"
  timeout = 120
}

# IAM configs
iam = {
  policies = {
    event_bridge_scheduler = "policy_scheduler_invoke_sns"
    lambda_schedule        = "policy_lambda_schedule"
    lambda_subscription    = "policy_lambda_subscription"
  },
  roles = {
    event_bridge_scheduler = "role_scheduler_invoke_sns"
    lambda_schedule        = "role_lambda_schedule"
    lambda_subscription    = "role_lambda_subscription"
  }
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
