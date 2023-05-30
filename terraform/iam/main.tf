# Policy and role to subscription lambda
resource "aws_iam_role_policy" "policy_lambda_subscription" {
  name = var.iam.policies.lambda_subscription
  role = aws_iam_role.role_lambda_subscription.id
  policy = file("./iam/policies/policy-lambda-subscription.json")
}
resource "aws_iam_role" "role_lambda_subscription" {
  name = var.iam.roles.lambda_subscription
  assume_role_policy = file("./iam/roles/role-lambda.json")
}

# Policy and role to schedule lambda
resource "aws_iam_role_policy" "policy_lambda_schedule" {
  name = var.iam.policies.lambda_schedule
  role = aws_iam_role.role_lambda_schedule.id
  policy = file("./iam/policies/policy-lambda-schedule.json")
}
resource "aws_iam_role" "role_lambda_schedule" {
  name = var.iam.roles.lambda_schedule
  assume_role_policy = file("./iam/roles/role-lambda-schedule.json")
}

# Policy and role to eventBridge scheduler
resource "aws_iam_role_policy" "policy_scheduler" {
  name = var.iam.policies.event_bridge_scheduler
  role = aws_iam_role.role_scheduler.id
  policy = file("./iam/policies/policy-scheduler.json")
}
resource "aws_iam_role" "role_scheduler" {
  name = var.iam.roles.event_bridge_scheduler
  assume_role_policy = file("./iam/roles/role-scheduler.json")
}
