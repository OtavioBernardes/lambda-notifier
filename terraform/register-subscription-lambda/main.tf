resource "aws_lambda_function" "this" {
  filename      = data.external.generate_lambda_zip.result.file_name
  function_name = var.register_subscription_lambda.lambda_name
  role          = data.aws_iam_role.this.arn
  handler       = var.register_subscription_lambda.lambda_handler

  runtime = var.register_subscription_lambda.runtime
}