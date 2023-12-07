
data "aws_security_group" "existing_sg" {
    id = var.SECURITY_GROUP
}

data "aws_codecommit_repository" "existing_repo" {
    repository_name = var.source_repo_name
}

resource "aws_instance" "d4ml-iac-terraform-igne" {
    ami                  = var.AMI_ID
    instance_type        = var.INSTANCE_TYPE
    iam_instance_profile = var.IAM_INSTANCE_PROFILE
    key_name = var.KEY_PAIR_NAME
    vpc_security_group_ids = [data.aws_security_group.existing_sg.id]
    subnet_id            = var.SUBNET_ID

    metadata_options {
        http_tokens                 = "required"
        http_put_response_hop_limit = 3
        http_endpoint               = "enabled"
    }
}