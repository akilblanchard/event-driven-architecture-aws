#Archive File for Lambda Function
data "archive_file" "lambda_zip"{
    type = "zip"
    source_file = "${path.module}/../lambda/lambda.py"
    output_path = "${path.module}/../lambda/lambda.zip"
}