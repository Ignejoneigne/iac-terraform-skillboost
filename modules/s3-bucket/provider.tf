provider "aws" {
    alias  = "secondary"
    region = var.AWS_SECONDARY_REGION
    profile = "dev-mfa"
}