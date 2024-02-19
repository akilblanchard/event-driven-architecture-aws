#-----------------
#Backend Specific Variables
#-----------------
variable "key"{
  description = "Name of Key for backend configuration"
  type = string
}
variable "region" {
  type    = string
  description = "The AWS region where the S3 bucket is located."
}

variable "bucket" {
  description = "Name of the s3 bucket that holds the terraform state file"
  type        = string
}

variable "dynamodb_table" {
  description = "Name of Database for state locking"
  type        = string
}


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


#------------------
#DynamoDB Variables
#------------------
variable "database_table" {
  description = "Name of Database for state locking"
  type        = string
}
variable "billing_mode"{
  description = "Billing mode of the DynamoDB table"
  type = string
}
variable "hash_key" {
  description = "Attribute Name"
  type        = string
}
variable "attr_name" {
  description = "Attribute Name"
  type = string
}
variable "attr_type" {
  description = "Attribute Type"
  type = string
}


#-------------
#SNS Topic Variables
#-------------
variable "sns_topic_name"{
  description = "Name of the SNS Topic"
  type = string
}
variable "fifo_topic_sns"{
  description = "Decide wether or not SNS Topic will have FIFO enabled"
  type = bool
}


#--------------------------------
#SNS Topic Subscription Variables
#--------------------------------
variable "subscription_protocol"{
  description = "Protocl used to receive messages from the SNS Topic"
  type = string
}
variable "raw_message_delivery"{
  description = "Decides if any formatting will be done to the messages"
  type = bool
}


#-------------------
#SQS Queue Variables
#-------------------
variable "sqs_queue_name"{
  description = "Name of the SQS Queue"
  type = string
}
variable "sqs_fifo_queue"{
  description = "Decide wether or not SQS Queue will have FIFO enabled"
  type = bool
}
variable "sqs_receive_time"{
  description = "Duration SQS Queue will wait to recevie each message. The value is counted in seconsds"
  type = number
}
variable "sqs_retention_time"{
  description = "Duration SQS Queue will retain messages. The value is counted in seconds"
  type = number
}
variable "redrive_max_recieve_count"{
  description = "Max number of times a message delivery can be attempted before going to Dead Letter Queue"
  type = number
}


#---------------------------
#Dead Letter Queue Variables
#---------------------------
variable "sqs_dead_letter_queue_name"{
  description = "Name of the Dead Letter Queue"
  type = string
}
variable "fifo_dead_letter_queue"{
  description = "Decide wether or not Dead Letter Queue will  have FIFO enabled"
  type = bool
}


#----------------
#Lambda Variables
#----------------
variable "function_name"{
  description = "Name of Lambda Function"
  type = string
}

variable "lambda_filename"{
  description = "Path to Lambda source code"
  type = string
}

variable "lambda_handler"{
  description = "Entry point for Lambda Function"
  type = string
}

variable "lambda_runtime"{
  description = "Runtime environment for the Lambda Function"
  type = string
}
variable "batch_size" {
  description = "Batch size for Lambda to process messages from the event source"
  type = string
}