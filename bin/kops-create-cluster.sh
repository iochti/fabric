#!/usr/bin/env bash

export NODE_SIZE=${NODE_SIZE:-t2.micro}
export MASTER_SIZE=${MASTER_SIZE:-t2.micro}

# Supposing our zone is eu-west-1
export REGION="eu-west-1"
export ZONES="eu-west-1a"
export TF_STATE_STORE="iochti.terraform"
export KOPS_STATE_STORE="s3://$TF_STATE_STORE"
export NAME="iochtik8s.k844.net"
export NODE_COUNT=4
# creates the k8 cluster files
kops create cluster ${NAME} \
    --node-size $NODE_SIZE \
    --master-size $MASTER_SIZE \
    --master-zones $ZONES \
    --node-count $NODE_COUNT \
    --zones $ZONES \
    --out=./terraform \
    --target=terraform
