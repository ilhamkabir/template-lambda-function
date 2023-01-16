aws_access_key  = ""
aws_secret_key  = ""
account_id      = ""
region          = "us-east-1"

api_gateway     = {
    name        : "template-lambda-api",
    description : "test api"
}
sqs_queue_name  = "template-lambda-sqs-queue"

lambda_function_name = "template-lambda-function"

ecr_name = "template-lambda"

lambda_iam_role_name = "template-lambda-role"
