# !/bin/sh
helm upgrade -f kube-prometheus-stack/values.yaml kube-prometheus-stack prometheus-community/kube-prometheus-stack -n monitoring