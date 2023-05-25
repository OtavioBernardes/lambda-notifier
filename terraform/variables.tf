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
    lambda_name    = string
    lambda_handler = string
    runtime        = string
  })
}

variable "role_schedule_lambda_name" {
  type = string
}

variable "schedule_message_lambda" {
  type = object({
    lambda_name    = string
    lambda_handler = string
    runtime        = string
  })
}

variable "role_lambda_name" {
  type = string
}

variable "policy_lambda_name" {
  type = string
}

variable "api_gateway" {
  type = object({
    name = string
    resources = list(
      object({
        resource = string
        lambda   = string
      })
    )
  })
}

variable "sns" {
  type = object({
    topic_name = string
  })
}
