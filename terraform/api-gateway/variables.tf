variable "register_subscription_lambda" {
  type = object({
    lambda_name    = string
    lambda_handler = string
    runtime        = string
  })
}

variable "environment" {
  type = string
}

variable "api_gateway"{
  type = object({
    name = string
    resource_subscription = string
    resource_schedule = string
  })
}