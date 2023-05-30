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
    timeout        = number
  })
}
variable "schedule_message_lambda" {
  type = object({
    lambda_name    = string
    lambda_handler = string
    runtime        = string
    timeout        = number
  })
}
variable "iam" {
  type = object({
    policy_lambda_subscription = string
    policy_lambda_schedule     = string
    role_lambda_subscription   = string
    role_lambda_schedule       = string
  })
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
