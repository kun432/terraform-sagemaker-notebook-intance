provider "aws" {
  region = "ap-northeast-1"
  default_tags {
    tags = {
      Env          = "dev"
      ProjectNname = "terraform-sagemaker-notebook-instance"
    }
  }
}
