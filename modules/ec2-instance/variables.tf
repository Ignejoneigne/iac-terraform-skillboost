variable "AMI_ID" {
    description = "The ID of the AMI to use for the instance"
    type        = string
}

variable "INSTANCE_TYPE" {
    description = "The type of instance to start"
    type        = string
}

variable "IAM_INSTANCE_PROFILE" {
    description = "The IAM instance profile to associate with the instance"
    type        = string
}

variable "SECURITY_GROUP" {
    description = "The ID of the existing security group"
    type        = string
}

variable "source_repo_name" {
    description = "The name of the source repository"
    type        = string
}

variable "PROJECT_NAME" {
  description = "The name of the project"
  type        = string
}

variable "KEY_PAIR_NAME" {
    description = "The name of the existing key pair"
    type        = string
}

variable "SUBNET_ID" {
    description = "The ID of the subnet"
    type        = string
}