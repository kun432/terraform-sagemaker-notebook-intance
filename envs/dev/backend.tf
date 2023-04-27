terraform {
  backend "s3" {
    bucket = "terraform-sagemaker-notebook-instance-tfstate"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}
