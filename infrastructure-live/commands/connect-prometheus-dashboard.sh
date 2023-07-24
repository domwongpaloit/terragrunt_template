# !/bin/sh
kubectl port-forward svc/kube-prometheus-stack-prometheus 9090 -n monitoring