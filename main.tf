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
data "aws_vpc" "main" {
  default = true
}

locals {
    account_id = "your-account-id"  # replace with your AWS account ID
    region     = var.AWS_DEFAULT_REGION
}

#Module for creating a new S3 bucket for storing pipeline artifacts
module "s3_artifacts_bucket" {
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
module "codecommit_infrastructure_source_repo" {
    source = "./modules/codecommit"
    CODECOMMIT_REPO_NAME = var.CODECOMMIT_REPO_NAME
    CODECOMMIT_BRANCH = var.CODECOMMIT_BRANCH
}

# Module for Infrastructure Validation - CodeBuild

module "codebuild_terraform" {
    depends_on = [
        module.codecommit_infrastructure_source_repo
    ]
    source = "./modules/codebuild"

    build_project_source                = module.s3-bucket.bucket_name
    builder_compute_type                = "LINUX_CONTAINER"
    builder_image                       = "aws/codebuild/standard:4.0"
    builder_image_pull_credentials_type = "CODEBUILD"
    builder_type                        = "LINUX_CONTAINER"
    kms_key_arn                         = module.codepipeline_kms.arn
    AWS_DEFAULT_REGION                  = var.AWS_DEFAULT_REGION
    BUCKET_NAME                         = var.BUCKET_NAME
    CODEBUILD_PROJECT_NAME              = var.CODEBUILD_PROJECT_NAME
    PROJECT_NAME                        = var.PROJECT_NAME
    ENVIRONMENT                         = var.ENVIRONMENT
    tags = {
        Project_Name = var.CODEBUILD_PROJECT_NAME
    }
}

# Module for Infrastructure Validate, Plan, Apply and Destroy - CodePipeline
#module "codepipeline_terraform" {
#    depends_on = [
#        modules.codebuild,
#    ]
#    source = "./modules/codepipeline"
#
#    project_name          = var.PROJECT_NAME
#    source_repo_name      = var.source_repo_name
#    source_repo_branch    = var.source_repo_branch
#    s3_bucket_name        = var.BUCKET_NAME
#    codepipeline_role_arn = var.CODEPIPELINE_ROLE_ARN
#    stages                = var.STAGE_INPUT
#
#    tags = {
#        Project_Name = var.PROJECT_NAME
#        Environment  = var.ENVIRONMENT
#        Account_ID   = data.aws_caller_identity.current.account_id
#        Region       = var.AWS_DEFAULT_REGION
#    }
#}

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