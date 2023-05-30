terraform {
  required_version = "1.3.7"
  required_providers {
    aws = {
      "source"  = "hashicorp/aws",
      "version" = "4.60.0"
    }
  }
}

provider "aws" {
  region = var.aws.region
}

module "iam" {
  source = "./iam"
  iam    = var.iam
}

module "sns" {
  source = "./sns"
  sns    = var.sns
}

module "api-gateway" {
  source      = "./api-gateway"
  api_gateway = var.api_gateway
  environment = var.environment

  depends_on = [
    module.iam,
    module.register-subscription-lambda,
    module.schedule-message-lambda
  ]
}

module "register-subscription-lambda" {
  source = "./register-subscription-lambda"
  lambda = {
    name      = var.register_subscription_lambda.name
    handler   = var.register_subscription_lambda.handler
    runtime   = var.register_subscription_lambda.runtime
    timeout   = var.register_subscription_lambda.timeout
    role_name = var.iam.roles.lambda_subscription
  }
  sns = var.sns

  depends_on = [
    module.iam,
    module.sns
  ]
}

module "schedule-message-lambda" {
  source                      = "./schedule-message-lambda"
  role_event_bridge_scheduler = var.iam.roles.event_bridge_scheduler
  lambda = {
    name      = var.schedule_message_lambda.name
    handler   = var.schedule_message_lambda.handler
    runtime   = var.schedule_message_lambda.runtime
    timeout   = var.schedule_message_lambda.timeout
    role_name = var.iam.roles.lambda_schedule
  }
  sns = var.sns

  depends_on = [
    module.iam,
    module.sns
  ]
}
