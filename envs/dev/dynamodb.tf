resource "aws_dynamodb_table" "sagemaker_notebook_table" {
  name         = "sagemaker_notebook"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "SessionId"
  attribute {
    name = "SessionId"
    type = "S"
  }
}
