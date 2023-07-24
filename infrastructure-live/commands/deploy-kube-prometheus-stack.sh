# !/bin/sh
helm install kube-prometheus-stack prometheus-community/kube-prometheus-stack  -f kube-prometheus-stack/values.yaml -n monitoring --create-namespace --wait