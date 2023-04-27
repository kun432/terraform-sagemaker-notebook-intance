resource "aws_s3_bucket" "sagemaker_notebook_index" {
  bucket = "sagemaker-notebook-index"
}

resource "aws_s3_bucket_versioning" "sagemaker_notebook_index" {
  bucket = aws_s3_bucket.sagemaker_notebook_index.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "sagemaker_notebook_index" {
  bucket = aws_s3_bucket.sagemaker_notebook_index.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
