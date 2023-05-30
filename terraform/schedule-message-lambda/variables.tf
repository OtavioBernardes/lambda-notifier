variable "role_event_bridge_scheduler" {
  type = string
}
variable "lambda" {
  type = object({
    name      = string
    handler   = string
    runtime   = string
    timeout   = number
    role_name = string
  })
}

variable "sns" {
  type = object({
    topic_name = string
  })
}
