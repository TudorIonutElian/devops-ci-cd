terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

/**********************************************************
  # Add configuration to authorisation keys
  # Configure the AWS Provider  
**********************************************************/

provider "aws" {
  shared_config_files      = ["~/.aws/devops-ci-cd/config"]
  shared_credentials_files = ["~/.aws/devops-ci-cd/credentials"]
  profile                  = "default"
}