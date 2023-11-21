#data "aws_codecommit_repository" "existing_repository" {
#  count           = var.create_new_repo ? 0 : 1
#  repository_name = var.source_repo_name
#}

data "aws_codecommit_repository" "existing_repository" {
    count           = var.create_new_repo ? 0 : 1
    repository_name = var.source_repo_name
}

resource "aws_codecommit_repository" "new_repository" {
    count           = var.create_new_repo ? 1 : 0
    repository_name = var.source_repo_name
}
