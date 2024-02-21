output "bucket_id" {
  description = "The ID of the created S3 bucket"
  value       = aws_s3_bucket.terraform_state_bucket.id
}

output "table_id" {
  description = "The ARN of the created DynamoDB table"
  value       = aws_dynamodb_table.terraform_state_lock.arn
}