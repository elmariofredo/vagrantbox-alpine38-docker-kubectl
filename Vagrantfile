$script = <<-SCRIPT
export AZURE_CLI_VERSION=2.0.72
export KUBECTL_VERSION=v1.12.2

sudo apk add docker --no-cache && \
sudo addgroup vagrant docker && \
sudo rc-update add docker boot && \
sudo service docker start && \
sudo curl https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
sudo chmod +x /usr/local/bin/kubectl && \
echo "k8s" | sudo tee /etc/hostname && \
sudo hostname -F /etc/hostname && \
sudo sed 's/alpine38/k8s/g' -i /etc/hosts && \
sudo sed 's/alpine38/k8s/g' -i /etc/sysconfig/network && \
sudo sed 's/alpine38/k8s/g' -i /etc/network/interfaces
SCRIPT


Vagrant.configure("2") do |config|
  config.vm.box = "generic/alpine38"
  config.vm.box_version = "1.9.22"
  config.vm.provision "shell", inline: $script
end
