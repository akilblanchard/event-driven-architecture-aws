#SNS Topic Variables
sns_topic_name = "custom-order-sns.fifo"

fifo_topic_sns = true

subscription_protocol = "sqs"

raw_message_delivery = true


#SQS Queue Variables
sqs_queue_name  = "order-processing-queue.fifo"

sqs_fifo_queue = true

sqs_receive_time = 20

sqs_retention_time = 18400

redrive_max_recieve_count = 4


#Dead Letter Queue Variables
sqs_dead_letter_queue_name = "order-process-dl-queue.fifo"

fifo_dead_letter_queue = true


#Lambda Function Variables 
function_name = "sqs_message_check"

lambda_filename = "./../lambda/lambda.zip"

lambda_handler = "lambda.handler"

lambda_runtime = "python3.8"


#Lambda Event Source Mapping

batch_size = "2"