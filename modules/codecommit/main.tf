resource "aws_codecommit_approval_rule_template" "source_repository_approval" {
    name        = "${var.source_repo_name}-${var.source_repo_branch}-Rule"
    description = "Approval rule template for enabling approval process"

    content = <<EOF
{
        "Version": "2018-11-08",
        "DestinationReferences": ["refs/heads/${var.source_repo_branch}"],
        "Statements": [{
                "Type": "Approvers",
                "NumberOfApprovalsNeeded": 2
        }]
}
EOF
}

resource "aws_codecommit_approval_rule_template_association" "source_repository_approval_association" {
    approval_rule_template_name = aws_codecommit_approval_rule_template.source_repository_approval.name
    repository_name             = data.aws_codecommit_repository.existing_repository[0].repository_name
}