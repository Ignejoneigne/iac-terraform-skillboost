resource "aws_codebuild_project" "terraform_codebuild_project" {
    count = length(var.CODEBUILD_PROJECT_NAME)

    name           = var.CODEBUILD_PROJECT_NAME[count.index]
    service_role   = var.CODEBUILD_ROLE_ARN
    tags           = var.tags

    source {
        type            = "CODECOMMIT"
        location        = var.CODECOMMIT_REPO_URL
        git_clone_depth = 1
        buildspec       = "buildspec.yml" 
    }

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
}