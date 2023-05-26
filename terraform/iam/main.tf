# Policy and role to subscription lambda
resource "aws_iam_role_policy" "policy_lambda_subscription" {
  name = var.iam.policy_lambda_subscription
  role = aws_iam_role.role_lambda_subscription.id
  policy = file("./iam/policies/policy-lambda-subscription.json")
}
resource "aws_iam_role" "role_lambda_subscription" {
  name = var.iam.role_lambda_subscription
  assume_role_policy = file("./iam/roles/role-lambda.json")
}

# Policy and role to schedule lambda
resource "aws_iam_role_policy" "policy_lambda_schedule" {
  name = var.iam.policy_lambda_schedule
  role = aws_iam_role.role_lambda_schedule.id
  policy = file("./iam/policies/policy-lambda-schedule.json")
}
resource "aws_iam_role" "role_lambda_schedule" {
  name = var.iam.role_lambda_schedule
  assume_role_policy = file("./iam/roles/role-lambda-schedule.json")
}
