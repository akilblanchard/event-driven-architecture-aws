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