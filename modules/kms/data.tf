data "aws_codecommit_repository" "existing_repo" {
    repository_name = var.CODECOMMIT_REPO_NAME
}