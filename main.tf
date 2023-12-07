
#Specify the required version of Terraform and the required providers
terraform {
    required_version = ">= 1.0.0"

    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = ">= 5.25.0"
        }
    }
}
#Configure the AWS provider
provider "aws" {
    region  = var.AWS_DEFAULT_REGION
    profile = "dev-mfa"
}

variable "AWS_SECONDARY_REGION" {
    description = "The secondary AWS region"
    type        = string
}
#data "aws_vpc" "main" {
#  default = true
#}

locals {
    region     = var.AWS_DEFAULT_REGION
}

#Module for creating a new S3 bucket for storing pipeline artifacts
module "s3_bucket" {
  source = "./modules/s3-bucket"
  PROJECT_NAME = var.PROJECT_NAME
  BUCKET_NAME = var.BUCKET_NAME
  AWS_DEFAULT_REGION= var.AWS_DEFAULT_REGION
}

# Calls a module that creates an IAM role.
module "iam-role" {
    source = "./modules/iam-role"
    CODEPIPELINE_ROLE_NAME = var.CODEPIPELINE_ROLE_NAME
    create_new_role = var.create_new_role
    PROJECT_NAME = var.PROJECT_NAME
}

# Calls a module that sets up a CodeCommit repository for infrastructure source code.
module "codecommit_infrastructure_source_repo" {
    source = "./modules/codecommit"

    source_repo_name = var.CODECOMMIT_REPO_NAME
    CODECOMMIT_REPO_NAME = var.CODECOMMIT_REPO_NAME
    CODECOMMIT_BRANCH = var.CODECOMMIT_BRANCH
}

# Defines an EC2 instance resource.
resource "aws_instance" "ec2_instance" {
    instance_type          = var.INSTANCE_TYPE
    iam_instance_profile   = var.IAM_INSTANCE_PROFILE
    ami                    = var.AMI_ID
    vpc_security_group_ids = [var.SECURITY_GROUP]
    key_name               = var.KEY_PAIR_NAME
    subnet_id              = var.SUBNET_ID

    tags = {
        PROJECT_NAME = var.PROJECT_NAME
    }
}

# Calls a module that sets up a CodeBuild project for infrastructure validation.
module "codebuild_terraform" {
  source = "./modules/codebuild"

  depends_on = [module.codecommit_infrastructure_source_repo]

  builder_compute_type                = "BUILD_GENERAL1_SMALL"
  builder_image                       = "aws/codebuild/standard:4.0"
  builder_image_pull_credentials_type = "CODEBUILD"
  builder_type                        = "LINUX_CONTAINER"
  kms_key_arn                         = var.kms_key_arn
  build_project_source                = "https://git-codecommit.eu-west-1.amazonaws.com/v1/repos/d4ml-iac-terraform-skillboost"
  ENVIRONMENT                         = "dev"
  CODECOMMIT_REPO_URL                 = var.CODECOMMIT_REPO_URL
  BUCKET_NAME                         = var.BUCKET_NAME
  AWS_DEFAULT_REGION                  = var.AWS_DEFAULT_REGION
  CODECOMMIT_REPO_NAME = var.CODECOMMIT_REPO_NAME
  CODECOMMIT_BRANCH                   = var.CODECOMMIT_BRANCH
  CODEBUILD_PROJECT_NAME              = var.CODEBUILD_PROJECT_NAME
  CODEBUILD_ROLE_ARN = var.CODEBUILD_ROLE_ARN
  tags = {
    PROJECT_NAME = var.PROJECT_NAME
  }
}


