terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.25.0"
    }
  }
}

provider "aws" {
  region  = var.AWS_DEFAULT_REGION
  profile = "dev-mfa"
}

data "aws_vpc" "default" {
  default = true
}
