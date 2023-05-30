data "external" "generate_lambda_zip" {
  # Script run from the main.tf path
  program = ["bash", "../scripts/generate-lambda.sh"]

  query = {
    lambda_name = var.schedule_message_lambda.lambda_name
  }
}

data "aws_iam_role" "this" {
  name = var.role_schedule_lambda_name
}

data "aws_iam_role" "role_scheduler" {
  name = var.role_scheduler
}

data "aws_sns_topic" "this" {
  name = var.sns.topic_name
}
