variable "role_lambda_name" {
  type = string
}

variable "hello_world_lambda" {
  type = object({
    lambda_name    = string
    lambda_handler = string
    runtime        = string
  })
}
