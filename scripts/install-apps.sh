#!/bin/bash

# Update the system
cd ~
sudo apt update

# Install unzip, git, and Python (if not already installed)
sudo apt install -y unzip git python3 python3-pip

# Download and install Terraform (latest version)
wget https://releases.hashicorp.com/terraform/1.6.3/terraform_1.6.3_linux_amd64.zip
unzip terraform_1.6.3_linux_amd64.zip
sudo mv terraform /usr/local/bin/

# Install the AWS CLI
curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Check versions of installed applications
echo "unzip version:"
