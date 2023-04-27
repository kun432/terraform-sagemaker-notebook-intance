# terraform-devcontainer-boilerplate

## About

VS Code devcontainer boilerplate for Terraform including:

- tfenv
- tgenv
- terraform
- terragrunt
- tflint
- tfupdate
- terraform VSCode extentions

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

