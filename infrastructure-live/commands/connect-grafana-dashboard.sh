# !/bin/sh

kubectl port-forward svc/kube-prometheus-stack-grafana 9091:80 -n monitoring