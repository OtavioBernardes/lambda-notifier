data "external" "generate_lambda_zip" {
  program = ["bash", "../scripts/generate-lambda.sh"]
}

data "aws_iam_role" "this" {
  name = var.role_lambda_name
}