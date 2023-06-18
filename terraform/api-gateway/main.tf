resource "aws_api_gateway_rest_api" "this" {
  name        = var.api_gateway.name
  description = "Terraform Serverless Application"
}

resource "aws_api_gateway_resource" "this" {
  for_each = { for idx, val in var.api_gateway.resources : idx => val }

  rest_api_id = aws_api_gateway_rest_api.this.id
  parent_id   = aws_api_gateway_rest_api.this.root_resource_id
  path_part   = each.value.resource
}

resource "aws_api_gateway_method" "this" {
  for_each = { for idx, val in var.api_gateway.resources : idx => val }

  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.this[each.key].id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "this" {
  for_each = data.aws_lambda_function.this

  rest_api_id = aws_api_gateway_rest_api.this.id
  resource_id = aws_api_gateway_method.this[each.key].resource_id
  http_method = aws_api_gateway_method.this[each.key].http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = each.value.invoke_arn
}

resource "aws_api_gateway_deployment" "this" {
  depends_on = [
    "aws_api_gateway_integration.this",
  ]

  rest_api_id = aws_api_gateway_rest_api.this.id
  stage_name  = var.environment
}

resource "aws_lambda_permission" "this" {
  for_each = { for idx, val in var.api_gateway.resources : idx => val }

  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = each.value.lambda
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.this.execution_arn}/*/*"
}
