variable "role_schedule_lambda_name" {
  type = string
}

variable "schedule_message_lambda" {
  type = object({
    lambda_name    = string
    lambda_handler = string
    runtime        = string
    timeout        = number
  })
}

variable "sns" {
  type = object({
    topic_name = string
  })
}
