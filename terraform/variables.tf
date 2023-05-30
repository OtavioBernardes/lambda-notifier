variable "environment" {
  type = string
}

variable "aws" {
  type = object({
    region = string
  })
}

variable "sns" {
  type = object({
    topic_name = string
  })
}

variable "register_subscription_lambda" {
  type = object({
    name    = string
    handler = string
    runtime = string
    timeout = number
  })
}

variable "schedule_message_lambda" {
  type = object({
    name    = string
    handler = string
    runtime = string
    timeout = number
  })
}

variable "iam" {
  type = object({
    policies = object({
      event_bridge_scheduler = string
      lambda_schedule        = string
      lambda_subscription    = string
    })
    roles = object({
      event_bridge_scheduler = string
      lambda_schedule        = string
      lambda_subscription    = string
    })
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
