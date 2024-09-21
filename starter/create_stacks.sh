#!/bin/bash

# Create the network and servers stack
aws cloudformation create-stack \
  --stack-name my-network-servers-stack \
  --template-body file://network.yml \
  --parameters file://network-parameters.json \
  --capabilities CAPABILITY_IAM

# Check if the first stack creation was successful
if [ $? -ne 0 ]; then
  echo "Failed to create my-network-servers-stack"
  exit 1
fi

# Create the Udagram application stack
aws cloudformation create-stack \
  --stack-name UdagramAppStack \
  --template-body file://udagram.yml \
  --parameters file://udagram-parameters.json \
  --capabilities CAPABILITY_NAMED_IAM

# Check if the second stack creation was successful
if [ $? -ne 0 ]; then
  echo "Failed to create UdagramAppStack"
  exit 1
fi

echo "Both stacks created successfully!"
