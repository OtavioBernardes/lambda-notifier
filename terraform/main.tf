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
  source             = "./iam"
  role_lambda_name   = var.role_lambda_name
  policy_lambda_name = var.policy_lambda_name
}

module "register-subscription-lambda" {
  source           = "./register-subscription-lambda"
  role_lambda_name = var.role_lambda_name
  register_subscription_lambda = {
    lambda_name    = var.register_subscription_lambda.lambda_name
    lambda_handler = var.register_subscription_lambda.lambda_handler
    runtime        = var.register_subscription_lambda.runtime
  }
  depends_on = [
    module.iam
  ]
}

module "api-gateway" {
  source = "./api-gateway"
  register_subscription_lambda = {
    lambda_name      = var.register_subscription_lambda.lambda_name
    lambda_handler   = var.register_subscription_lambda.lambda_handler
    runtime          = var.register_subscription_lambda.runtime
  }
  environment   = var.environment
  resource_path = var.resource_path
  api_gateway_name = var.api_gateway_name

  depends_on = [
    module.iam,
    module.register-subscription-lambda
  ]
}
