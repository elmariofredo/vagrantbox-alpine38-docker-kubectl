#!/bin/sh

set -euo pipefail
IFS=$'\n\t'

rm -rf tmp
mkdir tmp
cd tmp
vagrant destroy --force
vagrant box add --provider virtualbox --name k8s-test ../package.box --force
vagrant init k8s-test
# vagrant init embedit/k8s --box-version 1
vagrant up
vagrant ssh --command "docker ps"
vagrant ssh --command "kubectl"
vagrant destroy --force
rm -rf tmp

echo "Success"
