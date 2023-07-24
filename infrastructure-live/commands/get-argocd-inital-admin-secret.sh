# !/bin/sh

echo $(kubectl get secrets argocd-initial-admin-secret -o yaml -n argocd | grep password | cut -d ':' -f2 | cut -d ' ' -f2) | base64 --decode

