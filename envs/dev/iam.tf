data "aws_iam_policy_document" "sagemaker_notebook_assumerole_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["sagemaker.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "sagemaker_notebook_policy" {

  statement {
    effect = "Allow"
    actions = [
      "s3:ListAllMyBuckets",
    ]
    resources = [
      aws_s3_bucket.sagemaker_notebook_index.arn
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:ListBucket",
    ]
    resources = [
      "${aws_s3_bucket.sagemaker_notebook_index.arn}",
      "${aws_s3_bucket.sagemaker_notebook_index.arn}/*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
    ]
    resources = [
      aws_ecr_repository.sagemaker_notebook.arn
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:CreateLogGroup",
      "logs:DescribeLogStreams",
    ]
    resources = [
      "arn:aws:logs:*:*:log-group:/aws/sagemaker/*"
    ]
  }
  statement {
    effect = "Allow"
    actions = [
      "dynamodb:BatchGet*",
      "dynamodb:DescribeStream",
      "dynamodb:DescribeTable",
      "dynamodb:Get*",
      "dynamodb:Query",
      "dynamodb:Scan",
      "dynamodb:BatchWrite*",
      "dynamodb:CreateTable",
      "dynamodb:Delete*",
      "dynamodb:Update*",
      "dynamodb:PutItem"
    ]
    resources = [
      aws_dynamodb_table.sagemaker_notebook_table.arn
    ]
  }
}

resource "aws_iam_policy" "sagemaker_notebook_policy" {
  name        = "${var.project}-base-policy"
  description = "SageMaker Notebook Base Policy"
  policy      = data.aws_iam_policy_document.sagemaker_notebook_policy.json
}

resource "aws_iam_role" "sagemaker_notebook_role" {
  name               = "${var.project}-role"
  assume_role_policy = data.aws_iam_policy_document.sagemaker_notebook_assumerole_policy.json
}

resource "aws_iam_policy_attachment" "sagemaker_notebook_policy_attachment" {
  name       = "${var.project}-attach-base-policy"
  roles      = [aws_iam_role.sagemaker_notebook_role.name]
  policy_arn = aws_iam_policy.sagemaker_notebook_policy.arn
}
