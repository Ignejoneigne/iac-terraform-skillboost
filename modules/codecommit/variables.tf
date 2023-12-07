variable "CODECOMMIT_REPO_NAME" {
    description = "The name of the CodeCommit repository"
    type        = string
}

variable "CODECOMMIT_BRANCH" {
    description = "The branch of the CodeCommit repository"
    type        = string
}

variable "create_new_repo" {
    description = "A boolean flag to indicate whether a new repository should be created"
    type        = bool
    default     = true
}

variable "source_repo_name" {
    description = "The name of the source repository"
    type        = string
}