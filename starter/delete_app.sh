#!/bin/bash

# Delete the Udagram application stack
aws cloudformation delete-stack --stack-name UdagramAppStack

# Check if the first deletion command was successful
if [ $? -ne 0 ]; then
  echo "Failed to delete UdagramAppStack"
  exit 1
fi

echo "UdagramAppStack deleted successfully!"