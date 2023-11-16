provider "aws" {
    region  = var.AWS_DEFAULT_REGION
}

data "aws_s3_bucket" "existing_bucket" {
    bucket = var.BUCKET_NAME
}