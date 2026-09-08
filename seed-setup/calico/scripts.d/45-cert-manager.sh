set -e
export KUBECONFIG=/etc/kubernetes/admin.conf



# install cert-manager
kubectl apply -f "https://github.com/cert-manager/cert-manager/releases/download/v1.20.3/cert-manager.yaml"



