FROM ubuntu:bionic
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y

# Deps
RUN apt-get install -y gnupg ca-certificates

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
RUN echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" \
  | tee /etc/apt/sources.list.d/mongodb-org-4.0.list

RUN apt-get update && apt-get install -y redis-tools mongodb-org-shell postgresql curl git dnsutils tcpdump nmap telnet inetutils-ping vim jq openssl netcat-openbsd make

#Install GO
RUN curl -O https://dl.google.com/go/go1.14.6.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.14.6.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin
#TODO
#- dlv
#- jvm
#- flamegraphs
