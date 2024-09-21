# Overview
This README provides instructions for creating and deleting the Udagram application stack and the associated network stack using AWS CloudFormation. The scripts provided automate the process of managing these stacks.
Prerequisites
AWS CLI installed and configured with appropriate permissions.
Access to the CloudFormation service in your AWS account.
The necessary template files (udagram.yml, network.yml) and parameters files (udagram-parameters.json, network-parameters.json) must be available in your working directory.
Scripts
1. Create Stacks
   Udagram Application Stack
   To create the Udagram application stack, use the following script:
   bash
   #!/bin/bash

# Create the Udagram application stack
aws cloudformation create-stack \
--stack-name UdagramAppStack \
--template-body file://udagram.yml \
--parameters file://udagram-parameters.json \
--capabilities CAPABILITY_NAMED_IAM

# Check if the stack creation was successful
if [ $? -ne 0 ]; then
echo "Failed to create UdagramAppStack"
exit 1
fi

echo "App created successfully!"

Network and Servers Stack
To create the network and servers stack, use this script:
bash
#!/bin/bash

# Create the network and servers stack
aws cloudformation create-stack \
--stack-name my-network-servers-stack \
--template-body file://network.yml \
--parameters file://network-parameters.json \
--capabilities CAPABILITY_IAM

# Check if the stack creation was successful
if [ $? -ne 0 ]; then
echo "Failed to create my-network-servers-stack"
exit 1
fi

echo "Network created successfully!"

2. Delete Stacks
   Delete Network and Servers Stack
   To delete the network and servers stack, run the following script:
   bash
   #!/bin/bash

# Delete the network and servers stack
aws cloudformation delete-stack --stack-name my-network-servers-stack

# Check if the deletion was successful
if [ $? -ne 0 ]; then
echo "Failed to delete my-network-servers-stack"
exit 1
fi

echo "Network stacks deleted successfully!"

Usage Instructions
Create Stacks:
Execute create_stacks_app.sh to set up the Udagram application.
Execute create_stacks_network.sh to set up the network and servers.
Delete Stacks:
Execute delete_network.sh when you need to remove the network and servers stack.