#Creates Lambda resource
resource "aws_lambda_function" "lambda_results"{
    function_name = "sqs_message_check"
    filename = "${path.module}/../lambda/lambda.zip"
    role = "${aws_iam_role.lambda_function_role.arn}"
    handler = "lambda.handler"
    source_code_hash = "${data.archive_file.lambda_zip.output_base64sha256}"
    runtime = "python3.8"
}

#Adds SQS as a trigger for the Lambda Function
resource "aws_lambda_event_source_mapping" "sqs_trigger"{
    event_source_arn = aws_sqs_queue.order_process.arn
    function_name = aws_lambda_function.lambda_results.function_name
    batch_size = 2
    depends_on = [ aws_sqs_queue.order_process ]
}

#Policy for Lambda to take on role of an AWS Lambda
resource "aws_iam_role" "lambda_function_role" {
    name = "LambdaFunctionRole"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Sid = ""
                Principal = {
                    Service = "lambda.amazonaws.com"
                }
            }
        ]
    })

    tags = {
        tag-key = "almbda-role"
    }
}

#Policy allowing Lambda to get messages from sqs queue
resource "aws_iam_role_policy" "lambda_role_sqs_policy"{
    name = "AllowSqsLambda"
    role = aws_iam_role.lambda_function_role.id

    policy = jsondecode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = [
                    "sqs:ChangeMessageVisibility",
                    "sqs:DeleteMessage",
                    "sqs:GetQueueAttributes",
                    "sqs:ReceiveMesasage"
                ]
                Effect = "Allow"
                Resource = "*"
            }
        ]
    })
}

#Allows for logging to CloudWatch
resource "aws_iam_role_policy" "lanbda_role_log_policy"{
    name = "AllowLambdaLogs"
    role = aws_iam_role.lambda_function_role.id

    policy = jsonencode({
        Version = "2012-10-17"
        Statement =[
            {
                Action = [
                    "logs:CreateLogGroup",
                    "logs:CreateLogStream",
                    "logs:PutLogEvents"
                ]
                Effect = "Allow"
                Resource = "*"
            }
        ]
    })
}