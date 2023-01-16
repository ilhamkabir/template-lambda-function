resource "aws_api_gateway_integration" "itemPostMethod-ApiProxyIntegration" {
  rest_api_id             = aws_api_gateway_rest_api.apiGateway.id
  resource_id             = aws_api_gateway_resource.itemResource.id
  http_method             = aws_api_gateway_method.itemPostMethod.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.lambda.invoke_arn
}
