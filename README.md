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

then, reopen in container in VSCode.

next, open terminal in VSCode and deploy resources.

```shell
$ cd envs/dev
$ terragrunt init
$ terragrunt apply
```

open AWS management console, go to SageMaker notebooks instances menu, and open  jupyter notebook/lab.

For clean,

```shell
$ terragrunt destroy
```

## ToDo

- add VPC and EFS (because notebook instance has only small-sized disk) and set LifeCycle to use it.
