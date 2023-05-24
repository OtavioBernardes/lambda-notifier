variable "role_lambda_name" {
  type = string
}

variable "register_subscription_lambda" {
  type = object({
    lambda_name    = string
    lambda_handler = string
    runtime        = string
  })
}
variable "sns" {
  type = object({
    topic_name    = string
  })
}