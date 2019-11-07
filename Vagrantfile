Vagrant.configure("2") do |config|
  config.vm.box = "generic/alpine310"
  config.vm.box_version = "1.9.40"

  config.ssh.shell = "/bin/bash"

  config.vm.provision "file", source: "./provision/profile-k8s.sh", destination: "/tmp/k8s.sh"
  config.vm.provision "file", source: "./provision/provision.sh", destination: "/tmp/provision.sh"
  
  config.vm.provision "shell", inline: <<-SHELL
    export KUBECTL_VERSION=v1.12.2
    /tmp/provision.sh
  SHELL
end
