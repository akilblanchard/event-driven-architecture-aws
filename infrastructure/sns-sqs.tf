#This creates the sns topic that will alert the sqs queue (Fifo Enabeld)
resource "aws_sns_topic" "customer_order"{
    name = var.sns_topic_name 
    fifo_topic = var.fifo_topic_sns
}


#The sqs queue to accept messages from sns (Fifo Enabled)
resource  "aws_sqs_queue" "order_process"{
    name = var.sqs_queue_name 
    fifo_queue = var.sqs_fifo_queue 

    receive_wait_time_seconds = var.sqs_receive_time 
    message_retention_seconds = var.sqs_retention_time 

    redrive_policy = jsonencode({
        deadLetterTargetArn = aws_sqs_queue.order_process_dl_queue.arn
        maxReceiveCount = var.redrive_max_recieve_count
    })
}


#Dead Letter Queue
resource "aws_sqs_queue" "order_process_dl_queue" {
    name = var.sqs_dead_letter_queue_name 
    fifo_queue = var.fifo_dead_letter_queue
}


#Connects sqs to sns queue
resource "aws_sns_topic_subscription" "custom_order_subscription"{
    protocol = var.subscription_protocol 
    raw_message_delivery = var.raw_message_delivery
    topic_arn = aws_sns_topic.customer_order.arn
    endpoint = aws_sqs_queue.order_process.arn
}


#IAM Polic for sns to sqs queue
resource "aws_sqs_queue_policy" "sqs_from_sns"{
    queue_url = aws_sqs_queue.order_process.id
    policy = data.aws_iam_policy_document.sqs_from_sns.json
}

data "aws_iam_policy_document" "sqs_from_sns"{

    statement {
        sid = "First"
        effect = "Allow"

        principals {
            type = "Service"
            identifiers = ["sns.amazonaws.com"]
        }

        actions = ["sqs:SendMessage"]
        resources = [aws_sqs_queue.order_process.arn]

        condition {
            test = "ArnEquals"
            variable = "aws:SourceArn"
            values = [aws_sns_topic.customer_order.arn]
        }
    }
}
