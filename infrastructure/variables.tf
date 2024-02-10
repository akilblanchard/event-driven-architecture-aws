#s3  bucket variables

variable "s3_bucket_name"{
    description = "Name of the s3 bucket that holds the terraform state file"
    type = "string"
    default = "dev-tfstate-s3"
}