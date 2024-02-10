resource "aws_dynamodb_table" "state" {
  name         = var.tfstate_db_name
  billing_mode = "PAY_PER_REQUEST" 
  hash_key     = var.hash_key

  attribute {
    name = var.attr_name
    type =  var.attr_type
  }
}