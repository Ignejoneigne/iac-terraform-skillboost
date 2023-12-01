AMI_ID               = "ami-09e838a758cc6574b"
AWS_DEFAULT_REGION   = "eu-west-1"
AWS_SECONDARY_REGION = "eu-central-1"
BUCKET_NAME          = "d4ml-iac-terraform"
CODEBUILD_PROJECT_NAME = ["d4ml-dev-igne-project", "d4ml-dev-igne1-project"]
#CODEBUILD_ROLE_ARN   = "arn:aws:iam::823164954914:role/service-role/codebuild-d4ml-iac-terraform-service-role"
CODEBUILD_ROLE_NAME= "role-d4ml-cloud9-deployment"
#CODEBUILD_ROLE_NAME  = "codebuild-d4ml-iac-terraform-service-role"
CODECOMMIT_REPO_NAME = "d4ml-iac-terraform-skillboost"
CODECOMMIT_REPO_URL  = "https://git-codecommit.eu-west-1.amazonaws.com/v1/repos/d4ml-iac-terraform-skillboost"
CODECOMMIT_BRANCH    = "d4ml-iac-terraform-igne"
#CODEPIPELINE_ROLE_ARN = "arn:aws:iam::823164954914:role/service-role/AWSCodePipelineServiceRole-eu-central-1-d4ml-iac-terraform"
#CODEPIPELINE_ROLE_NAME = "AWSCodePipelineServiceRole-eu-central-1-d4ml-iac-terraform"
CODEPIPELINE_ROLE_NAME = "role-d4ml-cloud9-deployment"
ENVIRONMENT          = "dev"
IAM_INSTANCE_PROFILE = "role-d4ml-cloud9-deployment"
IAM_ROLE_NAME        = "role-d4ml-cloud9-deployment"
IAM_USER_ARN         = "arn:aws:iam::823164954914:role/role-d4ml-cloud9-deployment"
IAM_USER_NAME        = "AWSCodePipelineServiceRole-eu-central-1-d4ml-iac-terraform"
CODEBUILD_ROLE_ARN = "arn:aws:iam::823164954914:role/role-d4ml-cloud9-deployment"
CODEPIPELINE_ROLE_ARN = "arn:aws:iam::823164954914:role/role-d4ml-cloud9-deployment"
INSTANCE_NAME        = "d4ml-iac-terraform-igne"
INSTANCE_TYPE        = "t2.micro"
KEY_PAIR_NAME        = "igne_kp"
PRIVATE_IP_CIDR      = "192.168.1.147/32"
PROJECT_NAME         = "d4ml-iac-terraform-igne"
SECURITY_GROUP       = "sg-00cc91238d74dae57"
source_repo_branch   = "main"
source_repo_name     = "my-source-repo"
USER_IP_ADDRESS      = "5.20.132.172/32"
VPC_ID               = "vpc-08bf37a6e1daabbde"
SUBNET_ID = "subnet-0ce16f4e9360575be"
builder_compute_type = "BUILD_GENERAL1_SMALL" #Information about the compute resources the build project will use
builder_image = "aws/codebuild/standard:4.0"  #Docker image to use for the build project
build_projects       = ["project1", "project2"] #List of Names of the CodeBuild projects to be created
builder_type = "LINUX_CONTAINER"
builder_image_pull_credentials_type = "CODEBUILD" #Type of credentials AWS CodeBuild uses to pull images in your build.
build_project_source = "" #Information about the build output artifact location
create_new_repo      = false
create_new_role      = false
create_new_security_group = false

tags = {
    Name = "d4ml-iac-terraform-igne",
    Environment = "dev",
    Project = "d4ml"
}


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
