resource "aws_codepipeline" "pipeline" {
    name     = "${var.PROJECT_NAME}-pipeline"
    role_arn = var.CODEPIPELINE_ROLE_ARN

    artifact_store {
        location = var.S3_BUCKET_NAME
        type     = "S3"
    }

    stage {
        name = "Source"

        action {
            name             = "Download-Source"
            category         = "Source"
            owner            = "AWS"
            provider         = "CodeCommit"
            version          = "1"
            output_artifacts = ["SourceOutput"]

            configuration = {
                RepositoryName       = var.source_repo_name
                BranchName           = var.source_repo_branch
                PollForSourceChanges = "true"
            }
        }
    }



    dynamic "stage" {
        for_each = var.STAGE_INPUT

        content {
            name = "Stage-${stage.value["name"]}"
            action {
                category         = stage.value["category"]
                name             = "Action-${stage.value["name"]}"
                owner            = stage.value["owner"]
                provider         = stage.value["provider"]
                input_artifacts  = stage.value["input_artifacts"]
                output_artifacts = stage.value["output_artifacts"]
                version          = "1"

                configuration = {
                    ProjectName = stage.value["provider"] == "CodeBuild" ? "${var.CODEBUILD_PROJECT_NAME}-${stage.value["name"]}" : null
                }
            }
        }
    }
}
