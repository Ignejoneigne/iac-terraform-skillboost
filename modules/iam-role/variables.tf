variable "CODEPIPELINE_ROLE_NAME" {
        description = "The name of the existing CodePipeline IAM role"
        type        = string
}

variable "create_new_role" {
        description = "Whether to create a new IAM role"
        type        = bool
}

variable "PROJECT_NAME" {
    description = "The name of the project"
    type        = string
}