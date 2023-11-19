#!/bin/bash

# Update the system
cd ~
sudp apt update -y

# Install unzip, git, and Python (if not already installed)
sudo apt install -y unzip git python3 python3-pip

# Download and install Terraform (latest version)
wget https://releases.hashicorp.com/terraform/1.6.4/terraform_1.6.4_linux_amd64.zip
unzip terraform_1.6.4_linux_amd64.zip
sudo mv terraform /usr/local/bin/


# Check versions of installed applications
echo "unzip version:"

#Configure git credentials
git config --global credential.helper '!aws codecommit credential-helper $@'
git config --global credential.UseHttpPath true
