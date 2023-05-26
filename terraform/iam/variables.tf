variable "iam" {
  type = object({
    policy_lambda_subscription = string
    policy_lambda_schedule     = string
    role_lambda_subscription   = string
    role_lambda_schedule       = string
  })
}
