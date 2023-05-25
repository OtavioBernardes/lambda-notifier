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

variable "environment" {
  type = string
}