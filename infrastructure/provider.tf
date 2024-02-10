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
    bucket         = "767dev-tfstate-s3"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "dev-tfstate-db"
  }
}