data "aws_lambda_function" "this" {
  for_each = { for idx, val in var.api_gateway.resources : idx => val }

  function_name = each.value.lambda
}