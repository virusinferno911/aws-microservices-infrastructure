terraform {
  backend "s3" {
    bucket  = "oluwasheyi-devops-terraform-state-2026"
    key     = "global/ecr/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}