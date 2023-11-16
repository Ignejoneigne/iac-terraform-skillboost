variable "PIPELINE_NAME" {
    description = "The name of the CodePipeline"
    type        = string
}

variable "CODEPIPELINE_ROLE_ARN" {
    description = "The ARN of the IAM role for the CodePipeline"
    type        = string
}

variable "S3_BUCKET_NAME" {
    description = "The name of the S3 bucket for the CodePipeline"
    type        = string
}

variable "source_repo_name" {
    description = "The name of the source repository"
    type        = string
}

variable "source_repo_branch" {
    description = "The name of the source repository branch"
    type        = string
}

variable "STAGE_INPUT" {
    description = "A list of maps, where each map represents a stage in the CodePipeline"
    type        = list(map(string))
}

variable "CODEBUILD_PROJECT_NAME" {
    description = "The name of the CodeBuild project for the CodePipeline"
    type        = string
}

variable "PROJECT_NAME" {
    description = "The name of the project"
    type        = string
}