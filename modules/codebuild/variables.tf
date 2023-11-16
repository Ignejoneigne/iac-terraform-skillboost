variable "CODEBUILD_PROJECT_NAME" {
    description = "The name of the CodeBuild project"
    type        = string
}

variable "CODEBUILD_ROLE_ARN" {
    description = "The ARN of the IAM role for the CodeBuild project"
    type        = string
}

variable "CODECOMMIT_REPO_URL" {
    description = "The HTTP URL of the CodeCommit repository"
    type        = string
}