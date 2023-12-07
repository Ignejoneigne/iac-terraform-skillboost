output "project_name" {
  description = "The name of the project"
  value       = var.PROJECT_NAME
}

output "environment" {
  description = "The environment"
  value       = var.ENVIRONMENT
}

output "aws_default_region" {
  description = "The default AWS region"
  value       = var.AWS_DEFAULT_REGION
}

output "instance_type" {
  description = "The type of instance to start"
  value       = var.INSTANCE_TYPE
}

output "instance_name" {
  description = "The name of the instance"
  value       = var.INSTANCE_NAME
}

output "codecommit_name" {
  description = "The name of the Codecommit repository"
  value       = var.source_repo_name
}

output "codecommit_branch" {
  description = "The branch of the Codecommit repository"
  value       = var.source_repo_branch
}

output "codebuild_project_name" {
  description = "The name of the CodeBuild project"
  value       = var.CODEBUILD_PROJECT_NAME
}

output "codepipeline_role_name" {
  description = "The name of the IAM role for CodePipeline"
  value       = var.CODEPIPELINE_ROLE_NAME
}

output "iam_user_name" {
  description = "The name of the IAM user"
  value       = var.IAM_USER_NAME
}

