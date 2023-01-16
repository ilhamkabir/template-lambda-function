resource "aws_api_gateway_rest_api" "apiGateway" {
  name               = var.api_gateway.name
  description        = var.api_gateway.description
}

resource "aws_api_gateway_deployment" "lambda-proxy-api-deployment" {
  depends_on = [
    aws_api_gateway_integration.itemPostMethod-ApiProxyIntegration
  ]

  rest_api_id = aws_api_gateway_rest_api.apiGateway.id

  stage_name = var.environment
}

resource "aws_api_gateway_usage_plan" "lambda-proxy-usage-plan" {
  name        = "lambda-proxy-usage-plan-${var.environment}"
  description = "usage plan for lambda proxy"

  api_stages {
    api_id = aws_api_gateway_rest_api.apiGateway.id
    stage  = aws_api_gateway_deployment.lambda-proxy-api-deployment.stage_name
  }
}

resource "aws_api_gateway_api_key" "lambda-api-key" {
  name = "lambda-proxy-apikey-${var.environment}"
}

resource "aws_api_gateway_usage_plan_key" "lambda-proxy-usage-plan-key" {
  key_id        = aws_api_gateway_api_key.lambda-api-key.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.lambda-proxy-usage-plan.id
}
