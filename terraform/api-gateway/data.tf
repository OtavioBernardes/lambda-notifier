data "aws_lambda_function" "register_lambda" {
  function_name = var.api_gateway.resources[0].lambda
}

data "aws_lambda_function" "schedule_lambda" {
  function_name = var.api_gateway.resources[1].lambda
}