resource "aws_api_gateway_method_response" "itemPostMethod200Response" {
  rest_api_id = aws_api_gateway_rest_api.apiGateway.id
  resource_id = aws_api_gateway_resource.itemResource.id
  http_method = aws_api_gateway_method.itemPostMethod.http_method
  status_code = "200"

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = true
  }

  depends_on = [aws_api_gateway_method.itemPostMethod]
}
