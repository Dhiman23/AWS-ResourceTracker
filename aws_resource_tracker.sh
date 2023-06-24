#!/bin/bash

#################################
# Author: sajal
# Date: 24th-june
#
# Version: v1
#
# This script will report the AWS resource usage
###########################################
#AWS S3
#AWS EC2
#AWS Lambda
#AWS IAM Users
set -x
# list s3 buckets
echo "print List of S3 buckets"
aws s3 ls >> resourceTracker

# list EC2 Instances
echo "Print list of ec2 instance"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resourceTracker

# list lambda
echo "print lambda functions"
aws lambda list-functions >> resourceTracker

# list IAM users
echo "print IAm users"

aws iam list-users | jq '.Users[].UserName' >>resourceTracker
