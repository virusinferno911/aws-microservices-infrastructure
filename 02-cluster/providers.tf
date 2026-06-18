terraform {
  backend "s3" {
    bucket         = "oluwasheyi-devops-terraform-state-2026"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    # dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}