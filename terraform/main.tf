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

module "lambda" {
  source           = "./lambda"
  role_lambda_name = var.role_lambda_name
  hello_world_lambda = {
    lambda_name    = var.hello_world_lambda.lambda_name
    lambda_handler = var.hello_world_lambda.lambda_handler
    runtime        = var.hello_world_lambda.runtime
  }
  depends_on = [
    module.iam
  ]
}

module "api-gateway" {
  source = "./api-gateway"
  hello_world_lambda = {
    lambda_name    = var.hello_world_lambda.lambda_name
    lambda_handler = var.hello_world_lambda.lambda_handler
    runtime        = var.hello_world_lambda.runtime
  }
  environment   = var.environment
  resource_path = var.resource_path

  depends_on = [
    module.iam,
    module.lambda
  ]
}
