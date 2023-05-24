variable "register_subscription_lambda" {
  type = object({
    lambda_name    = string
    lambda_handler = string
    runtime        = string
  })
}

variable "resource_path" {
  type = string
}

variable "environment" {
  type = string
}

variable "api_gateway_name"{
  type = string
}