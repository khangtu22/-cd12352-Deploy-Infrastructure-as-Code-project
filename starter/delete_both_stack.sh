#!/bin/bash

# Delete the Udagram application stack
aws cloudformation delete-stack --stack-name UdagramAppStack

# Check if the first deletion command was successful
if [ $? -ne 0 ]; then
  echo "Failed to delete UdagramAppStack"
  exit 1
fi

# Delete the network and servers stack
aws cloudformation delete-stack --stack-name my-network-servers-stack

# Check if the second deletion command was successful
if [ $? -ne 0 ]; then
  echo "Failed to delete my-network-servers-stack"
  exit 1
fi

echo "Both stacks deleted successfully!"