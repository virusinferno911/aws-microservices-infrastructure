terraform {
  backend "s3" {
    bucket = "oluwasheyi-devops-terraform-state-2026"
    key = "global/s3/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt = true
  }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {
    bucket = "oluwasheyi-devops-terraform-state-2026"

    lifecycle {
      prevent_destroy = true
    }
}

resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
    bucket = aws_s3_bucket.terraform_state.id
    versioning_configuration {
      status = "Enabled"
    }
}

resource "aws_dynamodb_table" "terraform_locks" {
    name = "terraform-state-locking"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
        name ="LockID"
        type = "S"
    }  
}