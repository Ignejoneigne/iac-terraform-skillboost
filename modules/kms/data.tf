data "aws_codecommit_repository" "existing_repo" {
    repository_name = var.source_repo_name
}