#!/bin/sh -l

echo "Workspace $1"
TERRAFORM_WORKSPACE=$1
time=$(date)
echo "::set-output name=time::$time"

echo "::set-output name=prueba::$time"

export AWS_DEFAULT_REGION=$2
export AWS_ACCESS_KEY_ID=$3
export AWS_ACCESS_KEY_ID=$4
export AWS_SECRET_ACCESS_KEY=$5
export TF_VAR_AWS_CERTIFICATE=$6
export TF_VAR_AWS_ZONE=$7
export TF_VAR_AWS_REGION=$8

terraform init
terraform workspace select $TERRAFORM_WORKSPACE || terraform workspace new $TERRAFORM_WORKSPACE
