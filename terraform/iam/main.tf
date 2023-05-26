# Policy and role to subscription lambda
resource "aws_iam_role_policy" "policy_lambda_subscription" {
  name = var.iam.policy_lambda_subscription
  role = aws_iam_role.role_lambda_subscription.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:CreateNetworkInterface",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DeleteNetworkInterface",
          "ec2:AssignPrivateIpAddresses",
          "ec2:UnassignPrivateIpAddresses",
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "sns:subscribe"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}
resource "aws_iam_role" "role_lambda_subscription" {
  name = var.iam.role_lambda_subscription

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      },
    ]
  })
}

# Policy and role to schedule lambda
resource "aws_iam_role_policy" "policy_lambda_schedule" {
  name = var.iam.policy_lambda_schedule
  role = aws_iam_role.role_lambda_schedule.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:CreateNetworkInterface",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DeleteNetworkInterface",
          "ec2:AssignPrivateIpAddresses",
          "ec2:UnassignPrivateIpAddresses",
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "scheduler:CreateSchedule",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}
resource "aws_iam_role" "role_lambda_schedule" {
  name = var.iam.role_lambda_schedule

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      },
    ]
  })
}