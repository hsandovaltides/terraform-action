#!/bin/sh -l

echo "Workspace $1"
TERRAFORM_WORKSPACE=$1

export AWS_DEFAULT_REGION=$2
export AWS_ACCESS_KEY_ID=$3
export AWS_SECRET_ACCESS_KEY=$4
export TF_VAR_AWS_CERTIFICATE=$5
export TF_VAR_AWS_ZONE=$6
export TF_VAR_AWS_REGION=$2

terraform init
terraform workspace select $TERRAFORM_WORKSPACE || terraform workspace new $TERRAFORM_WORKSPACE

echo "::set-output name=result::Workspace Created or Selected $TERRAFORM_WORKSPACE"
