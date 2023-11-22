output "codecommit_repo_name" {
    description = "The name of the CodeCommit repository"
    value       = length(data.aws_codecommit_repository.existing_repository) > 0 ? data.aws_codecommit_repository.existing_repository[0].repository_name : "No repository found"
}

output "codecommit_repo_clone_url_http" {
    description = "The HTTP URL of the existing CodeCommit repository"
    value       = length(data.aws_codecommit_repository.existing_repository) > 0 ? data.aws_codecommit_repository.existing_repository[0].clone_url_http : "No repository found"
}

output "source_repo_name" {
    description = "The name of the existing CodeCommit repository"
    value       = length(data.aws_codecommit_repository.existing_repository) > 0 ? data.aws_codecommit_repository.existing_repository[0].repository_name : "No repository found"
}

output "CODECOMMIT_REPO_URL" {
    description = "The HTTP URL of the existing CodeCommit repository"
    value       = length(data.aws_codecommit_repository.existing_repository) > 0 ? data.aws_codecommit_repository.existing_repository[0].clone_url_http : "No repository found"
}