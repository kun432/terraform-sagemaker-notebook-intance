config {
  plugin_dir = "~/.tflint-plugin-cache"
}
plugin "aws" {
  enabled = true
  version = "0.23.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}