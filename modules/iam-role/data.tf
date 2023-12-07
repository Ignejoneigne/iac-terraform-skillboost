data "aws_iam_role" "existing_codepipeline_role" {
    count = var.create_new_role ? 0 : 1
    name  = var.CODEPIPELINE_ROLE_NAME
}

