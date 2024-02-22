#-----------------
#AWS Provider
#-----------------
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.32.1"
    }
  }

  backend "s3" {
    bucket = "767dev-tfstate-s3"
    key = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "dev-tfstate-db"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "remote_state" {
  source      = "../modules/remote_state"
  bucket_name = "767dev-tfstate-s3"
  database_table = "dev-tfstate-db"
  sse_algorithm = "aws:kms"
  deletion_period = 30
  s3_bucket_tag = "s3-Remote-State"
}
