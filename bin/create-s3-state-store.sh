#/usr/bin/env bash
# Load variables
export NODE_SIZE=${NODE_SIZE:-t2.micro}
export MASTER_SIZE=${MASTER_SIZE:-t2.micro}

# Supposing our zone is eu-west-1
export REGION="eu-west-1"
export ZONES="eu-west-1a"
export TF_STATE_STORE="iochti.terraform"
export KOPS_STATE_STORE="s3://$TF_STATE_STORE"
export NAME="iochtik8s.k844.net"

# Creates a S3 bucket which will contain the store
aws s3api create-bucket --bucket $TF_STATE_STORE --region $REGION --create-bucket-configuration LocationConstraint=$REGION --profile default
aws s3api put-bucket-versioning --bucket $TF_STATE_STORE --versioning-configuration "Status=Enabled" --profile default
