terraform {
    source = "../../..//terraform-modules/external-ingress-nginx"
}

inputs = {
    ingress_name = "external"
    cluster_name = dependency.eks.outputs.cluster_name
    cluster_endpoint = dependency.eks.outputs.cluster_endpoint
    cluster_certificate_authority_data = dependency.eks.outputs.cluster_certificate_authority_data
}

dependency "eks" {
  config_path = "../eks"

  mock_outputs = {
    cluster_name = ""
    cluster_endpoint = ""
    cluster_certificate_authority_data = ""
  }
}

dependency "kube-prometheus-stack" {
    config_path = "../kube-prometheus-stack"

    mock_outputs = {
        name = ""
    }
}

generate "helm_provider" {
  path      = "helm-provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF

provider "helm" {
  kubernetes {
    host                   = var.cluster_endpoint
    cluster_ca_certificate = base64decode(var.cluster_certificate_authority_data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
      command     = "aws"
    }
  }
}
EOF
}