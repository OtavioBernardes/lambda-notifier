data "external" "generate_lambda_zip" {
  # Script run from the main.tf path
  program = ["bash", "../scripts/generate-lambda.sh"]

  query = {
    lambda_name = var.lambda.name
  }
}

data "aws_iam_role" "this" {
  name = var.lambda.role_name
}

data "aws_sns_topic" "this" {
  name = var.sns.topic_name
}
