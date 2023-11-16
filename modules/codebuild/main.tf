resource "aws_codebuild_project" "project" {
    name          = var.CODEBUILD_PROJECT_NAME
    service_role  = var.CODEBUILD_ROLE_ARN

    source {
        type            = "CODECOMMIT"
        location        = var.CODECOMMIT_REPO_URL
        git_clone_depth = 1
    }

    artifacts {
        type = "NO_ARTIFACTS"
    }

    environment {
        compute_type                = "BUILD_GENERAL1_SMALL"
        image                       = "aws/codebuild/standard:5.0"
        type                        = "LINUX_CONTAINER"
        privileged_mode             = true
    }
}