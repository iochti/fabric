#!/usr/bin/env bash

source bin/variables.sh
# creates the k8 cluster files
kops create cluster ${NAME} \
    --node-size $NODE_SIZE \
    --master-size $MASTER_SIZE \
    --master-zones $ZONES \
    --zones $ZONES \
    --out=./terraform \
    --target=terraform
