variable "environment" {
  type = string
}

variable "aws" {
  type = object({
    region = string
  })
}

variable "register_subscription_lambda" {
  type = object({
    lambda_name = string
    lambda_handler = string
    runtime = string
  })
}

variable "role_lambda_name" {
  type = string
}

variable "policy_lambda_name" {
  type = string
}

variable "resource_path" {
  type = string
}

variable "api_gateway_name" {
  type = string
}

variable "sns" {
  type = object({
    topic_name    = string
  })
}