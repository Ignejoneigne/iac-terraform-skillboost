variable "source_repo_name" {
    description = "The updated description of the source repository"
    type        = string
    default     = "default_repo_name"
}

variable "source_repo_branch" {
    description = "The name of the source repository branch"
    type        = string
}

variable "PROJECT_NAME" {
  description = "The name of the project"
  type        = string
}

variable "create_new_repo" {
    description = "A boolean indicating whether to create a new repository"
    type        = bool
    default     = false
}

variable "CODECOMMIT_REPO_URL" {
    description = "The URL of the CodeCommit repository"
    type        = string
}