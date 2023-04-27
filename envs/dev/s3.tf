resource "aws_s3_bucket" "sagemaker_notebook_index" {
  bucket        = "sagemaker-notebook-index"
  force_destroy = true
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

resource "aws_s3_bucket_server_side_encryption_configuration" "sagemaker_notebook_index" {
  bucket = aws_s3_bucket.sagemaker_notebook_index.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
