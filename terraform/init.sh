# #!/bin/bash
# 
# This script is a bad idea. It's just supposed to make the initial setup/testing a bit faster.

# set up temp folder
base_path=${PWD###*/}
destination_folder=run
# rm -rf ${destination}
mkdir ${destination}


cp ${base_path}/main.tf ${base_path}/${destination_folder}/main.tf
cp ${base_path}/variables.tf ${base_path}/${destination_folder}/variables.tf
cp ${base_path}/terraform.tfvars ${base_path}/${destination_folder}/terraform.tfvars

# resources
cp ${base_path}/api-gateway-lambda-proxy/* ${base_path}/${destination_folder}/
cp ${base_path}/ecr/* ${base_path}/${destination_folder}/
cp ${base_path}/lambda/* ${base_path}/${destination_folder}/
# cp ${base_path}/s3/* ${base_path}/${destination_folder}/
cp ${base_path}/sqs/* ${base_path}/${destination_folder}/
