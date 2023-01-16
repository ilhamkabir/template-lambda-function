resource "aws_api_gateway_integration_response" "itemPostMethod-IntegrationResponse" {
  rest_api_id = aws_api_gateway_rest_api.apiGateway.id
  resource_id = aws_api_gateway_resource.itemResource.id
  http_method = aws_api_gateway_method.itemPostMethod.http_method

  status_code = aws_api_gateway_method_response.itemPostMethod200Response.status_code

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }

  depends_on = [
    aws_api_gateway_integration.itemPostMethod-ApiProxyIntegration
  ]
}
