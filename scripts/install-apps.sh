#!/bin/bash

# Update the system
cd ~
sudo apt update -y

# Install unzip, git, and Python (if not already installed)
sudo apt install -y unzip git python3 python3-pip

# Download and install Terraform (linux_386)
sudo rm /usr/local/bin/terraform
curl -s -qL -o terraform.zip https://releases.hashicorp.com/terraform/1.6.4/terraform_1.6.4_linux_386.zip
unzip -o terraform.zip
sudo mv terraform /bin
rm terraform.zip

# Check versions of installed applications
echo "unzip version:"

#Configure git credentials
git config --global credential.helper '!aws codecommit credential-helper $@'
git config --global credential.UseHttpPath true
