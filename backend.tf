/**********************************************************
  # Configure S3 Backend
**********************************************************/

terraform {
  backend "s3" {
    bucket         = "devops-ci-cd-12345678910"
    key            = "devops-ci-cd-12345678910.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "devops-ci-cd-12345678"
  }
}