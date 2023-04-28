resource "aws_dynamodb_table" "sagemaker_notebook_table" {
  name         = "${var.project}-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "SessionId"
  attribute {
    name = "SessionId"
    type = "S"
  }
}
