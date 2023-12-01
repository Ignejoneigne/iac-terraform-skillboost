
variable "CODEBUILD_ROLE_ARN" {
    description = "The ARN of the IAM role for the CodeBuild project"
    type        = string
}

variable "CODECOMMIT_REPO_NAME" {
    description = "The name of the CodeCommit repository"
    type        = string
}

variable "CODECOMMIT_REPO_URL" {
    description = "The HTTP URL of the CodeCommit repository"
    type        = string
}

variable "CODECOMMIT_BRANCH" {
    description = "The branch of the CodeCommit repository"
    type        = string
}

variable "AWS_DEFAULT_REGION" {
    description = "The default AWS region"
    type        = string
}

variable "BUCKET_NAME" {
    description = "The name of the S3 bucket"
    type        = string
}

variable "CODEBUILD_PROJECT_NAME" {
    description = "The names of the CodeBuild projects"
    type        = list(string)
    default     = []
}
variable "ENVIRONMENT" {
    description = "The environment (e.g., dev, prod)"
    type        = string
}

variable "builder_compute_type" {
    description = "The type of compute platform for the CodeBuild project"
    type        = string
}

variable "builder_image" {
    description = "The Docker image for the CodeBuild project"
    type        = string
}

variable "builder_type" {
    description = "The type of build environment for the CodeBuild project"
    type        = string
}

variable "privileged_mode" {
    description = "If set to true, enables running the Docker daemon inside a Docker container on the CodeBuild project"
    default     = true
}

variable "tags" {
  description = "Tags to be applied to the codebuild project"
  type        = map(any)
}

variable "builder_image_pull_credentials_type" {
  description = "Type of credentials AWS CodeBuild uses to pull images in your build."
  type        = string
}

variable "build_project_source" {
  description = "Information about the build output artifact location"
  type        = string
}

variable "kms_key_arn" {
  description = "ARN of KMS key for encryption"
  type        = string
}