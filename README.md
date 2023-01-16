# Template Lambdas Function

## Notes
    Why use the AWS Lambda Base Image?

    The container image needs to implement the Lambda Runtime API (which provides an HTTP API for custom runtimes to receive invocation events from Lambda and sends response data back within the Lambda execution environment).


## Prerequisites

- Install and configure the AWS CLI and Docker CLI


## Create an Image from the AWS Base Image

- Build the Docker image:
```
make docker-build
```
- Start the Docker image:
```
make docker-run
```
- Test the application locally using the runtime interface emulator (must run this from a new terminal window):
```
curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}'
```


## Terraform

- Notes: 
    - Before creating the Lambda, you'll need to follow the steps to "Create an Image from the AWS Base Image" and then "Manually Upload an Image to the Amazon ECR Repository". Then run the "terraform plan" step again. This is becasue the Lambda will try to pull an image from an empty ECR repo.
    - API Gateway isn't being deployed so you'll need to log in to the AWS Console and deploy the resourcce manually.


## Manually Upload an Image to the Amazon ECR Repository

- Authenticate the Docker CLI to your Amazon ECR registry:
```
aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <ecr-uri>
```
- Tag your image to match your repository name:
```
docker tag  <ecr-uri>:<tag-name> <ecr-uri>:<tag-name>
```
- Deploy the image to Amazon ECR:
```
docker push <ecr-uri>:<tag-name>
```


## CirceCI Setup

- Set the following environment variables:
    AWS_ACCESS_KEY_ID
    AWS_SECRET_ACCESS_KEY
    AWS_DEFAULT_REGION
    AWS_REGION
    AWS_ECR_REGISTRY_ID
    AWS_ECR_ACCOUNT_URL


### Rollback Deployment

- Add the "iamge tag" you want to roll back to. 
```
aws lambda update-function-code --function-name <function-name> --image-uri <ecr-uri>:<image-tag>
```
