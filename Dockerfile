FROM busybox:latest 

LABEL maintainer="deas"

ARG POLICY_GENERATOR_VERSION=1.16.0
ARG KSOPS_VERSION=4.3.2

RUN mkdir -p /tools/kustomize/plugin/policy.open-cluster-management.io/v1/policygenerator \
             /tools/kustomize/plugin/viaduct.ai/v1/ksops

WORKDIR /tools

RUN wget https://github.com/open-cluster-management-io/policy-generator-plugin/releases/download/v${POLICY_GENERATOR_VERSION}/linux-amd64-PolicyGenerator -O kustomize/plugin/policy.open-cluster-management.io/v1/policygenerator/PolicyGenerator \
    && chmod 755 kustomize/plugin/policy.open-cluster-management.io/v1/policygenerator/PolicyGenerator

RUN cd /tools/kustomize/plugin/viaduct.ai/v1/ksops && \
    wget https://github.com/viaduct-ai/kustomize-sops/releases/download/v${KSOPS_VERSION}/ksops_${KSOPS_VERSION}_Linux_x86_64.tar.gz -O - \
    | tar -xzvf -

