#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

# Install docker
apk add docker --no-cache
addgroup vagrant docker
rc-update add docker boot
service docker start

# Fix hostname
echo "k8s" | tee /etc/hostname
hostname -F /etc/hostname
sed 's/alpine38/k8s/g' -i /etc/hosts
sed 's/alpine38/k8s/g' -i /etc/sysconfig/network
sed 's/alpine38/k8s/g' -i /etc/network/interfaces

# Install bash
apk add bash bash-completion --no-cache
sed -e 's;/bin/ash$;/bin/bash;g' -i /etc/passwd

# Install alias completition
curl https://raw.githubusercontent.com/cykerway/complete-alias/1.6.0/bash_completion.sh > /etc/profile.d/complete_alias.sh

# Install K8s profile
mv /tmp/k8s.sh /etc/profile.d/k8s.sh

# Install kubectl
curl https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl
chmod +x /usr/local/bin/kubectl
mkdir /etc/bash_completion.d/
/usr/local/bin/kubectl completion bash > /etc/bash_completion.d/kubectl.sh

