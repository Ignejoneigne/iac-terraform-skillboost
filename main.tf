terraform {
    required_version = ">= 1.0.0"

    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = ">= 5.25.0"
        }
    }
}

provider "aws" {
    region  = var.AWS_DEFAULT_REGION
    profile = "dev-mfa"
}

variable "AWS_SECONDARY_REGION" {
    description = "The secondary AWS region"
    type        = string
}

locals {
    account_id = "your-account-id"  # replace with your AWS account ID
    region     = var.AWS_DEFAULT_REGION
}

#Module for creating a new S3 bucket for storing pipeline artifacts
module "s3-bucket" {
  source = "./modules/s3-bucket"
  PROJECT_NAME = var.PROJECT_NAME
  BUCKET_NAME = var.BUCKET_NAME
  AWS_DEFAULT_REGION= var.AWS_DEFAULT_REGION
}

module "iam-role" {
    source = "./modules/iam-role"
    CODEPIPELINE_ROLE_NAME = var.CODEPIPELINE_ROLE_NAME
    create_new_role = var.create_new_role
    PROJECT_NAME = var.PROJECT_NAME
}

# Module for Infrastructure Source code repository
module "codecommit" {
    source = "./modules/codecommit"
    source_repo_name = var.source_repo_name
    source_repo_branch = var.source_repo_branch
    CODECOMMIT_REPO_URL = var.CODECOMMIT_REPO_URL
    PROJECT_NAME = var.PROJECT_NAME
}

module "ec2-instance" {
    source = "./modules/ec2-instance"
    AMI_ID = var.AMI_ID
    INSTANCE_TYPE = var.INSTANCE_TYPE
    IAM_INSTANCE_PROFILE = var.IAM_INSTANCE_PROFILE
    SECURITY_GROUP = var.SECURITY_GROUP
    source_repo_name = var.source_repo_name
    PROJECT_NAME = var.PROJECT_NAME
    KEY_PAIR_NAME = var.KEY_PAIR_NAME
}