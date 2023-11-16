provider "aws" {
    alias  = "secondary"
    region = var.AWS_DEFAULT_REGION
    profile = "dev-mfa"
}