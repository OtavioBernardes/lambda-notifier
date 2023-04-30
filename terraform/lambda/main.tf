resource "aws_lambda_function" "this" {
  filename      = data.external.generate_lambda_zip.result.file_name
  function_name = var.hello_world_lambda.lambda_name
  role          = data.aws_iam_role.this.arn
  handler       = var.hello_world_lambda.lambda_handler

  runtime = var.hello_world_lambda.runtime
}