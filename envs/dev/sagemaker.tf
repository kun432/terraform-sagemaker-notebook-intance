# このリソースは、SageMaker ノートブックインスタンスを作成します。
resource "aws_sagemaker_notebook_instance" "sagemaker_notebook" {
  name          = var.project
  role_arn      = aws_iam_role.sagemaker_notebook_role.arn
  instance_type = "ml.t3.medium"
  lifecycle {
    create_before_destroy = true
  }
}
