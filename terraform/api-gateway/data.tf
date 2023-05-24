data "aws_lambda_function" "this" {
  function_name = var.register_subscription_lambda.lambda_name
}