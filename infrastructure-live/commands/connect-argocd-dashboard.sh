# !/bin/sh

kubectl port-forward svc/argocd-server 9092:80 -n argocd