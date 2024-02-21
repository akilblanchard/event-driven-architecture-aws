#--------------------
#s3  bucket variables
#--------------------
variable "bucket_name" {
  description = "Name of the s3 bucket that holds the terraform state file"
  type        = string
}
variable "s3_bucket_tag"{
  description = "Tag for s3 Bucket for State File"
  type = string
}

variable "sse_algorithm"{
  description = "Encryption process for KMS Key"
  type = string
}
variable "deletion_period"{
  description = "Deletion window of the KMS KEY. Default value is set to 15 days."
  type = number
  default = 15
}

variable "region"{
    description = "Default Region for s3 bucket"
    type = string
}


#------------------
#DynamoDB Variables
#------------------
variable "database_table" {
  description = "Name of Database for state locking"
  type        = string
}
