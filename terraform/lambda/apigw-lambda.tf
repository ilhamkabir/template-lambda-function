# Lambda
resource "aws_lambda_function" "lambda" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.role.arn
  # handler       = "lambda.lambda_handler"
  # runtime       = "python3.8"
  image_uri     = "${aws_ecr_repository.ecr_repo.repository_url}:latest"
  package_type  = "Image"
  depends_on = [
    aws_ecr_repository.ecr_repo
  ]
}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "apigateway.amazonaws.com"

  # More: http://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-control-access-using-iam-policies-to-invoke-api.html
  source_arn = "arn:aws:execute-api:${var.aws_region}:${var.account_id}:${aws_api_gateway_rest_api.apiGateway.id}/*/${aws_api_gateway_method.itemPostMethod.http_method}${aws_api_gateway_resource.itemResource.path}"
}
