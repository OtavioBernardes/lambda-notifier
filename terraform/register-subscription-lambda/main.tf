resource "aws_lambda_function" "this" {
  filename      = data.external.generate_lambda_zip.result.file_name
  function_name = var.lambda.name
  handler       = var.lambda.handler
  timeout       = var.lambda.timeout
  runtime       = var.lambda.runtime

  role = data.aws_iam_role.this.arn
  environment {
    variables = {
      SNS_TOPIC_ARN = data.aws_sns_topic.this.arn
    }
  }
}
