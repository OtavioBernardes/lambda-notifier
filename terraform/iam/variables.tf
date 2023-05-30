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
