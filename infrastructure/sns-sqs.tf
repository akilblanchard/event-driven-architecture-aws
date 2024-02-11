#This creates the sns topic that will alert the sqs queue (Fifo Enabeld)
resource "aws_sns_topic" "customer_order"{
    name = "custom-order-sns.fifo"
    fifo_topic = true
}


#The sqs queue to accept messages from sns (Fifo Enabled)
resource  "aws_sqs_queue" "order_process"{
    name = "order-processing-queue.fifo"
    fifo_queue = true

    receive_wait_time_seconds = 20
    message_retention_seconds = 18400

    redrive_policy = jsonencode({
        deadLetterTargetArn = aws_sqs_queue.order_process_dl_queue.arn
        maxReceiveCount = 4
    })
}


#Connects sqs to sns queue
resource "aws_sns_topic_subscription" "custom_order_subscription"{
    protocol = "sqs"
    raw_message_delivery = true
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


#Dead Letter Queue
resource "aws_sqs_queue" "order_process_dl_queue" {
    name = "order-process-dl-queue.fifo"
    fifo_queue = true
}