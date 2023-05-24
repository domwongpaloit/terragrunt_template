# !/bin/sh

# Get cluster name from first argument 
CLUSTER_NAME=$1

# Update kubeconfig for the given cluster name 
aws eks update-kubeconfig --name $CLUSTER_NAME --region ap-southeast-1