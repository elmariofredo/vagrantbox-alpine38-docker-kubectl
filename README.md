# vagrantbox-alpine38-docker-kubectl
Vagrant box with docker and kubectl

## Setup

vagrant init embedit/k8s  --box-version 1
vagrant up

`🔑 If you need to forward ssh keys add 'config.ssh.forward_agent = true' to Vagrantfile`

## Use

vagrant ssh --command "docker ps"
vagrant ssh --command "kubectl"
