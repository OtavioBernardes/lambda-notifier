variable "environment" {
  type = string
}

variable "aws" {
  type = object({
    region = string
  })
}

variable "hello_world_lambda" {
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