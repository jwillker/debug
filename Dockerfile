FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Initial
RUN apt-get update && \
    apt-get -y install \
    --no-install-recommends \
    gnupg ca-certificates curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# MongoDB
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 \
    --recv 9DA31620334BD75D9DCB49F368818C72E52529D4 && \
    echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" \
    | tee /etc/apt/sources.list.d/mongodb-org-4.0.list

# Kubectl
RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg \
    https://packages.cloud.google.com/apt/doc/apt-key.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" \
    | tee /etc/apt/sources.list.d/kubernetes.list

# Install tools
RUN apt-get update && apt-get -y install --no-install-recommends \
    redis-tools \
    mongodb-org-shell \
    postgresql \
    git \
    dnsutils \
    tcpdump \
    nmap \
    telnet \
    inetutils-ping \
    vim \
    jq \
    openssl \
    netcat-openbsd \
    make \
    python \
    kubectl \
    linux-tools-generic \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Configure perf
RUN rm /usr/bin/perf && ln -s /usr/lib/linux-tools/4.15.0-139-generic/perf /usr/bin/perf

# Install Go
RUN curl -O https://dl.google.com/go/go1.16.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.16.linux-amd64.tar.gz && \
    rm -rf go1.16.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin
