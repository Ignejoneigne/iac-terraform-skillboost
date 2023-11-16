PROJECT_NAME       = "d4ml-iac-terraform-igne"
ENVIRONMENT        = "dev"
AWS_DEFAULT_REGION = "eu-west-1"
AWS_SECONDARY_REGION = "eu-central-1"
PRIVATE_IP_CIDR      = "192.168.1.147/32"
AMI_ID               = "ami-09e838a758cc6574b"
KEY_PAIR_NAME        = "igne_kp"
IAM_INSTANCE_PROFILE = "role-d4ml-cloud9-deployment"
SECURITY_GROUP       = "sg-00cc91238d74dae57"
INSTANCE_TYPE        = "t2.micro"
INSTANCE_NAME        = "d4ml-iac-terraform-igne"
BUCKET_NAME = "d4ml-iac-terraform"
USER_IP_ADDRESS      = "5.20.132.172/32"
#CODECOMMIT_REPO = "d4ml-iac-terraform-skillboost-test"
CODEBUILD_PROJECT_NAME = "d4ml-iac-terraform-igne"
CODEBUILD_ROLE_NAME = "codebuild-d4ml-iac-terraform-service-role"
CODEBUILD_ROLE_ARN = "arn:aws:iam::823164954914:role/service-role/codebuild-d4ml-iac-terraform-service-role"
CODEPIPELINE_ROLE_NAME = "AWSCodePipelineServiceRole-eu-central-1-d4ml-iac-terraform"
CODEPIPELINE_ROLE_ARN = "arn:aws:iam::823164954914:role/service-role/AWSCodePipelineServiceRole-eu-central-1-d4ml-iac-terraform"
IAM_USER_NAME = "AWSCodePipelineServiceRole-eu-central-1-d4ml-iac-terraform"
IAM_USER_ARN = "arn:aws:iam::823164954914:user/DevIgneJone"
IAM_ROLE_NAME = "role-d4ml-cloud9-deployment"
source_repo_name = "d4ml-iac-terraform-skillboost"
source_repo_branch = "d4ml-iac-terraform-igne"
CODECOMMIT_REPO_URL = "https://git-codecommit.eu-west-1.amazonaws.com/v1/repos/d4ml-iac-terraform-skillboost" #update

create_new_repo    = false
create_new_security_group    = false
create_new_role    = false
build_projects = ["project1", "project2"]

STAGE_INPUT = [
    {
        name             = "validate",
        category         = "Test",
        owner            = "AWS",
        provider         = "CodeBuild",
        input_artifacts  = ["SourceOutput"],
        output_artifacts = ["ValidateOutput"]
    },
    {
        name             = "plan",
        category         = "Test",
        owner            = "AWS",
        provider         = "CodeBuild",
        input_artifacts  = ["ValidateOutput"],
        output_artifacts = ["PlanOutput"]
    },
    {
        name             = "apply",
        category         = "Build",
        owner            = "AWS",
        provider         = "CodeBuild",
        input_artifacts  = ["PlanOutput"],
        output_artifacts = ["ApplyOutput"]
    },
    {
        name             = "destroy",
        category         = "Build",
        owner            = "AWS",
        provider         = "CodeBuild",
        input_artifacts  = ["ApplyOutput"],
        output_artifacts = ["DestroyOutput"]
    }
]
