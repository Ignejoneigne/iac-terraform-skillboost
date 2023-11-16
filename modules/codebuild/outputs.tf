output "id" {
    value       = aws_codebuild_project.project.id
    description = "ID of the CodeBuild project"
}

output "name" {
    value       = aws_codebuild_project.project.name
    description = "Name of the CodeBuild project"
}

output "arn" {
    value       = aws_codebuild_project.project.arn
    description = "ARN of the CodeBuild project"
}