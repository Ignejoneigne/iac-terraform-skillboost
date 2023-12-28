AMI_ID               = 
AWS_DEFAULT_REGION   = "eu-west-1"
AWS_SECONDARY_REGION = "eu-central-1"
BUCKET_NAME          = 
CODEBUILD_PROJECT_NAME = ["d4ml-dev-igne-project", "d4ml-dev-igne1-project"]
#CODEBUILD_ROLE_ARN   =
CODEBUILD_ROLE_NAME=
#CODEBUILD_ROLE_NAME  =
CODECOMMIT_REPO_NAME = 
CODECOMMIT_REPO_URL  =
CODECOMMIT_BRANCH    =
#CODEPIPELINE_ROLE_ARN =
#CODEPIPELINE_ROLE_NAME =
CODEPIPELINE_ROLE_NAME = 
ENVIRONMENT          =
IAM_INSTANCE_PROFILE =
IAM_ROLE_NAME        =
IAM_USER_ARN         =
IAM_USER_NAME        =
CODEBUILD_ROLE_ARN =
CODEPIPELINE_ROLE_ARN =
INSTANCE_NAME        =
INSTANCE_TYPE        =
KEY_PAIR_NAME        =
PRIVATE_IP_CIDR      =
PROJECT_NAME         =
SECURITY_GROUP       =
source_repo_branch   =
source_repo_name     =
USER_IP_ADDRESS      = 
VPC_ID               = 
SUBNET_ID =
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
