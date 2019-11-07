export PS1='\u@\h:\W \$ '
    
source /etc/profile.d/bash_completion.sh
source /etc/bash_completion.d/kubectl.sh

echo ">>> Aliasing 'kubectl' as 'k', enjoy"
alias k=kubectl
complete -F _complete_alias k # Ensure that completition is working for k command

echo ">>> Setting 'KUBECONFIG=/vagrant/tmp/kube_config_cluster.yml' put your kubeconfig there"
export KUBECONFIG=/vagrant/tmp/kube_config_cluster.yml
