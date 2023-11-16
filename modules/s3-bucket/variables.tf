variable "BUCKET_NAME" {
    description = "The name of the existing S3 bucket"
    type        = string
}

variable "AWS_SECONDARY_REGION" {
    description = "The secondary AWS region"
    type        = string
}

variable "AWS_PROFILE" {
    description = "The AWS profile to use for authentication"
    type        = string
    default     = "default"
}

variable "PROJECT_NAME" {
  description = "The name of the project"
  type        = string
}