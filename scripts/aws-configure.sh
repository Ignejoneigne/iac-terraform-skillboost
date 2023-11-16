#!/bin/bash

# Get AWS access key ID and profile name from environment variables
AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
PROFILE_NAME=${PROFILE_NAME}
SESSION_TOKEN={SESSION_TOKEN}
#Configure git credentials
git config --global credential.helper '!aws codecommit credential-helper $@'
git config --global credential.UseHttpPath true

# Set AWS profile
aws configure --profile ${PROFILE_NAME}

# Set AWS access key ID
aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID} --profile ${PROFILE_NAME}

# Set AWS secret access key
aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY} --profile ${PROFILE_NAME}

# Set AWS session token
aws configure set aws_session_token ${SESSION_TOKEN} --profile ${PROFILE_NAME}

# List current configuration settings for the profile
aws configure list --profile ${PROFILE_NAME}