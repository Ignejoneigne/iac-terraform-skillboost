output "id" {
    description = "The IDs of the CodeBuild projects"
    value       = aws_codebuild_project.terraform_codebuild_project[*].id
}

output "name" {
    description = "The names of the CodeBuild projects"
    value       = aws_codebuild_project.terraform_codebuild_project[*].name
}