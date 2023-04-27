FROM mcr.microsoft.com/devcontainers/base:jammy

USER root

RUN apt update -y \
    && apt install -y locales language-pack-ja-base language-pack-ja locales \
    && sed -i '/^#.* ja_JP.UTF-8 /s/^#//' /etc/locale.gen \
    && locale-gen \
    && ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime\
    && dpkg-reconfigure -f noninteractive tzdata
ENV LANG="ja_JP.UTF-8"
ENV LANGUAGE="ja_JP:ja"
ENV LC_ALL="ja_JP.UTF-8"

RUN curl -sSL -o /tmp/awscliv2.zip "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" \
    && unzip /tmp/awscliv2.zip -d /tmp \
    && /tmp/aws/install

USER vscode
ENV HOME /home/vscode

ARG TERRAFORM_VERSION
ARG TERRAGRUNT_VERSION
ARG TFLINT_VERSION
ARG TFUPDATE_VERSION

# .terraformrc/.tflint.hcl
COPY ../.terraformrc $HOME/.
COPY ../.tflint.hcl $HOME/.

# tfenv/tgenv
RUN git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
RUN git clone https://github.com/cunymatthieu/tgenv.git ~/.tgenv
RUN echo 'export PATH="$HOME/.tfenv/bin:$HOME/.tgenv/bin:$PATH"' >> ~/.bashrc
ENV PATH $HOME/.tfenv/bin:$HOME/.tgenv/bin:$PATH
RUN tfenv install ${TERRAFORM_VERSION} \
    && tfenv use ${TERRAFORM_VERSION}
RUN tgenv install ${TERRAGRUNT_VERSION} \
    && tgenv use ${TERRAGRUNT_VERSION}

WORKDIR /tmp
RUN mkdir -p $HOME/.local/bin

# tflint
RUN curl -sSL -o /tmp/tflint_${TFLINT_VERSION}_linux_amd64.zip https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VERSION}/tflint_linux_amd64.zip \
    && unzip /tmp/tflint_${TFLINT_VERSION}_linux_amd64.zip \
    && sudo mv tflint $HOME/.local/bin

# tfupdate
RUN curl -sSL -o /tmp/tfupdate_${TFUPDATE_VERSION}_linux_amd64.tar.gz https://github.com/minamijoyo/tfupdate/releases/download/v${TFUPDATE_VERSION}/tfupdate_${TFUPDATE_VERSION}_linux_amd64.tar.gz \
    && sudo tar zxvf /tmp/tfupdate_${TFUPDATE_VERSION}_linux_amd64.tar.gz -C $HOME/.local/bin tfupdate
