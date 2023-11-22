resource "aws_codebuild_project" "terraform_codebuild_project" {
    count = length(var.CODEBUILD_PROJECT_NAME)

    name           = var.CODEBUILD_PROJECT_NAME[count.index]
    service_role   = var.CODEBUILD_ROLE_ARN
    tags           = var.tags

    artifacts {
        type = "S3"
        location = var.BUCKET_NAME
        encryption_disabled = true
    }

    environment {
        compute_type                = var.builder_compute_type
        image                       = var.builder_image
        type                        = var.builder_type
        image_pull_credentials_type = var.builder_image_pull_credentials_type
    }

    logs_config {
        cloudwatch_logs {
            status = "ENABLED"
        }
    }

    source {
        type      = "S3"
        buildspec = "./buildspec.yml"
    }
}