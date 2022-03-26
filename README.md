# ![debug](images/icon.png) Debug
A container image to help in debugs

[![ci](https://github.com/JohnWillker/debug/actions/workflows/ci.yaml/badge.svg)](https://github.com/JohnWillker/debug/actions/workflows/ci.yaml)
![Docker Pulls](https://img.shields.io/docker/pulls/jhonn/debug)
![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/jhonn/debug)


# Usage:

```shell
kubectl run debug --rm -i --tty --image jhonn/debug:latest -- /bin/bash
```

This command will open a shell, and you can interact with other components inside the Kubernetes cluster.

# Tools installed
### Utils
- gnupg 
- ca-certificates
- curl 
- git 
- dnsutils 
- tcpdump 
- nmap 
- telnet 
- inetutils-ping 
- vim 
- jq 
- openssl 
- netcat-openbsd 
- make
- perf
- kubectl
- redis-tools 
- mongodb-org-shell 
- postgresql 

### Languages:
- Golang
- Python


