FROM busybox:latest 

LABEL maintainer="deas"

ARG POLICY_GENERATOR_VERSION=1.16.0

RUN mkdir -p /tools/kustomize/plugin/policy.open-cluster-management.io/v1/policygenerator

WORKDIR /tools

RUN wget https://github.com/open-cluster-management-io/policy-generator-plugin/releases/download/v${POLICY_GENERATOR_VERSION}/linux-amd64-PolicyGenerator -O kustomize/plugin/policy.open-cluster-management.io/v1/policygenerator/PolicyGenerator && \
    chmod 755 kustomize/plugin/policy.open-cluster-management.io/v1/policygenerator/PolicyGenerator

