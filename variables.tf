
variable "PROJECT_NAME" {
    description = "The name of the project"
    type        = string
}
variable "ENVIRONMENT" {
    description = "The environment"
    type        = string
}

variable "AWS_DEFAULT_REGION" {
    description = "The default AWS region"
    type        = string
}

variable "PRIVATE_IP_CIDR" {
    description = "The CIDR block for the private IP"
    type        = string
    default = "eu-central-1"
}

variable "AMI_ID" {
    description = "The ID of the Amazon Machine Image (AMI)"
    type        = string
}

variable "KEY_PAIR_NAME" {
    description = "The name of the key pair"
    type        = string
}

variable "IAM_INSTANCE_PROFILE" {
    description = "The IAM instance profile to associate with launched instances"
    type        = string
}

variable "SECURITY_GROUP" {
    description = "The ID of the security group"
    type        = string
}

variable "INSTANCE_TYPE" {
    description = "The type of instance to start"
    type        = string
}

variable "INSTANCE_NAME" {
    description = "The name of the instance"
    type        = string
}

variable "USER_IP_ADDRESS" {
    description = "The IP address of the user"
    type        = string
}

variable "source_repo_name" {
    description = "The name of the source repository"
    type        = string
}

variable "source_repo_branch" {
    description = "The name of the source repository branch"
    type        = string
}
variable "BUCKET_NAME" {
    description = "The name of the S3 bucket"
    type        = string
}
variable "CODEBUILD_PROJECT_NAME" {
    description = "The name of the CodeBuild project"
    type        = string
}

variable "create_new_repo" {
    description = "Flag to determine whether to create a new repository"
    type        = bool
}

variable "create_new_security_group" {
    description = "Flag to determine whether to create a new security group"
    type        = bool
}

variable "create_new_role" {
    description = "Flag to determine whether to create a new role"
    type        = bool
}

variable "build_projects" {
    description = "The list of build projects"
    type        = list(string)
}

variable "CODEBUILD_ROLE_NAME" {
    description = "The name of the IAM role for CodeBuild"
    type        = string
}

variable "CODEBUILD_ROLE_ARN" {
    description = "The ARN of the IAM role for CodeBuild"
    type        = string
}

variable "CODEPIPELINE_ROLE_NAME" {
    description = "The name of the IAM role for CodePipeline"
    type        = string
}

variable "CODEPIPELINE_ROLE_ARN" {
    description = "The ARN of the IAM role for CodePipeline"
    type        = string
}

variable "IAM_USER_NAME" {
    description = "The name of the IAM user"
    type        = string
}

variable "IAM_USER_ARN" {
    description = "The ARN of the IAM user"
    type        = string
}

variable "IAM_ROLE_NAME" {
    description = "The name of the IAM role"
    type        = string
}

variable "STAGE_INPUT" {
    description = "The input for the stage"
    type        = list(object({
        name             = string
        category         = string
        owner            = string
        provider         = string
        input_artifacts  = list(string)
        output_artifacts = list(string)
    }))
}

variable "CODECOMMIT_REPO_URL" {
    description = "The URL of the CodeCommit repository"
    type        = string
}