# terraform-sagemaker-notebook-instance

## About

deploy SageMaker Notebook Instance using Terraform

## Prerequisite

make sure VScode installed on your host.

- VSCode
- VSCode devcontainer extention

make sure the folliwing config files and directories exist on your host. (will be mounted from devcontainer as volumes)

- ~/.gitconfig
- ~/.aws/
- ~/.terraform.d/plugin-cache/
- ~/.tflint.d/plugins/

from this template repository, create your repository and clone.

```shell
$ git clone YOUR-REPOSITORY && cd YOUR-REPOSITORY-DIR
```

open with VSCode.

```shell
$ code .
```

Finally, reopen in container in VSCode.

