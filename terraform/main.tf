terraform {
  required_version = "1.3.7"
  required_providers {
    aws = {
      "source"  = "hashicorp/aws",
      "version" = "4.60.0"
    }
    random = {
      "source"  = "hashicorp/random",
      "version" = "3.4.3"
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
module "register-subscription-lambda" {
  source                       = "./register-subscription-lambda"
  role_lambda_name             = var.iam.role_lambda_subscription
  register_subscription_lambda = var.register_subscription_lambda
  sns                          = var.sns

  depends_on = [
    module.iam,
    module.sns
  ]
}

module "schedule-message-lambda" {
  source                    = "./schedule-message-lambda"
  role_schedule_lambda_name = var.iam.role_lambda_schedule
  role_scheduler            = var.iam.role_scheduler
  schedule_message_lambda   = var.schedule_message_lambda
  sns                       = var.sns

  depends_on = [
    module.iam,
    module.sns
  ]
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
