output "codecommit_repo_name" {
    description = "The name of the existing CodeCommit repository"
    value       = data.aws_codecommit_repository.existing_repo.repository_name
}

variable "PROJECT_NAME" {
  description = "The name of the project"
  type        = string
}