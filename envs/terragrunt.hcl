remote_state {
  backend = "s3"
  generate = {
    path      = "_backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket  = "my-sagemaker-notebook-tfstate"
    key     = "${path_relative_to_include()}/terraform.tfstate"
    region  = "ap-northeast-1"
    encrypt = true
  }
}
