resource "aws_ecr_repository" "sagemaker_notebook" {
  name = "${var.project}"
}
