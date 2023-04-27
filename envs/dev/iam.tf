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
    ]
    resources = [
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
}

resource "aws_iam_policy" "sagemaker_notebook_policy" {
  name        = "sagemaker-notebook-policy"
  description = "SageMaker Notebook Policy"
  policy      = data.aws_iam_policy_document.sagemaker_notebook_policy.json
}

resource "aws_iam_role" "sagemaker_notebook_role" {
  name               = "sagemaker-notebook-role"
  assume_role_policy = data.aws_iam_policy_document.sagemaker_notebook_assumerole_policy.json
}

resource "aws_iam_policy_attachment" "sagemaker_notebook_policy_attachment" {
  name       = "sagemaker-notebook-policy-attachment"
  roles      = [aws_iam_role.sagemaker_notebook_role.name]
  policy_arn = aws_iam_policy.sagemaker_notebook_policy.arn
}

resource "aws_iam_policy_attachment" "sagemaker_notebook_policy_attachment_dynamodb_full" {
  name       = "sagemaker-notebook-policy-attachment-dynamodb-full"
  roles      = [aws_iam_role.sagemaker_notebook_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}
