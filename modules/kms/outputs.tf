output "clone_url_http" {
    value       = data.aws_codecommit_repository.existing_repo.clone_url_http
    description = "The clone URL of the existing CodeCommit repository"
}

output "repository_name" {
    value       = data.aws_codecommit_repository.existing_repo.repository_name
    description = "The name of the existing CodeCommit repository"
}

output "arn" {
    value       = data.aws_codecommit_repository.existing_repo.arn
    description = "The ARN of the existing CodeCommit repository"
}