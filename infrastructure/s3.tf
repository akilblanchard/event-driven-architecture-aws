#Bucket to hold Terraform State File

resource "aws_s3_bucket" "state_file" {
  bucket = var.s3_bucket_name

  force_destroy = true
  tags = {
    Nmae = "state_bucket"
  }
}

#Versioning for State Bucket

resource "aws_s3_bucket_versioning" "state_file" {
  bucket = var.s3_bucket_name

  versioning_configuration  {
    status = "Enabeled"
  }
}

#Blcoking public access to the State File Bucket

resource "aws_s3_bucket_public_access_block" "state" {
  bucket                  = var.s3_bucket_name
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#Enable Server-Side encrytpion 

resource "aws_s3_bucket_server_side_encryption_configuration" "state" {
  bucket = var.s3_bucket_name

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = "aws_kms.state.arn"
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_kms_key" "state" {
  description             = "S3 Bucket encrytpion key"
  deletion_window_in_days = 10
}