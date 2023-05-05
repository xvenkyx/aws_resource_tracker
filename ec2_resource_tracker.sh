#!/bin/bash

################
# Author: S Venkatesh
# Date: 05 May, 2023
# Version: v1
# This script will report the AWS resource usage.
################
set -x
# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users

# list s3 buckets
echo "print s3 buckets"
aws s3 ls >> output.txt

# list ec2 instances
echo "print ec2 instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> output.txt

# list lambda 
echo "print lambda functions"
aws lambda list-functions >> output.txt

# list IAM users
echo "print iam users list"
aws iam list-users | jq '.Users[].UserName' >> output.txt
