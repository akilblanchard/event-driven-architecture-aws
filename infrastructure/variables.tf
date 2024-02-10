#s3  bucket variables

variable "s3_bucket_name" {
  description = "Name of the s3 bucket that holds the terraform state file"
  type        = string
  default     = "dev-tfstate-s3"
}

#DynamoDB Variables

variable "tfstate_db_name" {
  description = "Name of Database for state locking"
  type        = string
  default     = "dev-tfstate-db"
}

variable "hash_key" {
  description = "Attribute Name"
  type        = string
  default     = "LockID"
}

variable "attr_name" {
  description = "Attribute Name"
  default     = "LockID"

}

variable "attr_type" {
  description = "Attribute Type"
  default     = "S"
}