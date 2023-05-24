data "external" "generate_lambda_zip" {
  # Script run from the main.tf path
  program = ["bash", "../scripts/generate-lambda.sh"] 

  query = {
    lambda_name = var.register_subscription_lambda.lambda_name
  }
}

data "aws_iam_role" "this" {
  name = var.role_lambda_name
}
