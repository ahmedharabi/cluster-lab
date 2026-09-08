set -e
export KUBECONFIG=/etc/kubernetes/admin.conf

# Runs after join_workers, because cert-manager cannot schedule until a worker exists.
kubectl wait --timeout=5m -n cert-manager \
  --for=condition=Available deployment/cert-manager-webhook

until [ -n "$(kubectl get validatingwebhookconfiguration cert-manager-webhook \
  -o jsonpath='{.webhooks[0].clientConfig.caBundle}')" ]; do
    sleep 1
done