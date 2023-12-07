output "bucket_id" {
    description = "The name of the S3 bucket"
    value       = data.aws_s3_bucket.existing_bucket.bucket
}

output "bucket_arn" {
    description = "The ARN of the S3 bucket"
    value       = data.aws_s3_bucket.existing_bucket.arn
}