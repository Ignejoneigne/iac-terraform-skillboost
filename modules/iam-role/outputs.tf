output "role_arn" {
    value       = data.aws_iam_role.existing_codepipeline_role[0].arn
    description = "The ARN of the existing IAM role"
}

output "role_name" {
    value       = data.aws_iam_role.existing_codepipeline_role[0].name
    description = "The name of the existing IAM role"
}