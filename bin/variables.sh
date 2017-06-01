#!/usr/bin/env bash

# Export all needed values for kops to work
#To reduce costs we use t2.micro ec2's
export NODE_SIZE=${NODE_SIZE:-t2.micro}
export MASTER_SIZE=${MASTER_SIZE:-t2.micro}

# Supposing our zone is eu-west-1
export REGION=eu-west-1
export ZONES=${ZONES:-"eu-west-1a,eu-west-1b,eu-west-1c"}
export TF_STATE_STORE=iochti.terraform
export KOPS_STATE_STORE="s3://$TF_STATE_STORE"
export NAME=iochticluster.k844.net

