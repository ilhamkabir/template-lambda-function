variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "account_id" {}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "environment" {
  type    = string
  default = "development"
}

variable "api_gateway" {
  type = object({
    name        = string
    description = string
  })
  # type    = string
}

variable "lambda_function_name" {}

variable "sqs_queue_name" {}

variable "ecr_name" {}

variable "lambda_iam_role_name" {}
