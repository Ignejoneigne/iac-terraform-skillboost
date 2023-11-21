resource "aws_codebuild_project" "terraform_codebuild_project" {
    count = length(var.CODEBUILD_PROJECT_NAME)

    name           = var.CODEBUILD_PROJECT_NAME[count.index]
    service_role   = var.CODEBUILD_ROLE_ARN
    tags           = var.tags

    artifacts {
        type = var.build_project_source
        location = var.BUCKET_NAME
    }

    environment {
        compute_type                = var.builder_compute_type
        image                       = var.builder_image
        type                        = var.builder_type
        privileged_mode             = var.privileged_mode
        image_pull_credentials_type = var.builder_image_pull_credentials_type
    }

    logs_config {
        cloudwatch_logs {
            status = "ENABLED"
        }
    }

    source {
        type      = var.build_project_source
        buildspec = "./buildspec.yml"
    }
}