resource "aws_codecommit_approval_rule_template" "source_repository_approval" {
    name        = "${var.CODECOMMIT_REPO_NAME}-${var.CODECOMMIT_BRANCH}-Rule"
    description = "Approval rule template for enabling approval process"

    content = <<EOF
{
        "Version": "2018-11-08",
        "DestinationReferences": ["refs/heads/${var.CODECOMMIT_BRANCH}"],
        "Statements": [{
                "Type": "Approvers",
                "NumberOfApprovalsNeeded": 2
        }]
}
EOF
}

resource "aws_codecommit_approval_rule_template_association" "source_repository_approval_association" {
    count                       = length(data.aws_codecommit_repository.existing_repository) > 0 ? 1 : 0
    approval_rule_template_name = aws_codecommit_approval_rule_template.source_repository_approval.name
    repository_name             = var.CODECOMMIT_REPO_NAME
}