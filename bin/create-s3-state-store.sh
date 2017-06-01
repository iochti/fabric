#/usr/bin/env bash
# Load variables
source bin/variables.sh

# Creates a S3 bucket which will contain the store
aws s3api create-bucket --bucket $TF_STATE_STORE --region $REGION --create-bucket-configuration LocationConstraint=$REGION --profile default
aws s3api put-bucket-versioning --bucket $TF_STATE_STORE --versioning-configuration "Status=Enabled" --profile default
