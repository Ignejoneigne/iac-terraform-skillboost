data "aws_s3_bucket" "existing_bucket" {
    bucket = var.BUCKET_NAME
    region = var.AWS_SECONDARY_REGION
    profile = "dev-mfa"
}