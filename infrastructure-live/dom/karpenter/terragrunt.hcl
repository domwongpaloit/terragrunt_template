# terraform {
#     source = "../../..//terraform-modules/karpenter"
# }

# inputs = {
#     cluster_oidc_issuer_url = dependency.eks.outputs.cluster_oidc_issuer_url
#     cluster_name = dependency.eks.outputs.cluster_name
#     cluster_endpoint = dependency.eks.outputs.cluster_endpoint
#     cluster_certificate_authority_data = dependency.eks.outputs.cluster_certificate_authority_data
#     worker_iam_role_name = dependency.eks.outputs.worker_iam_role_name
# }

# dependency "eks" {
#   config_path = "../eks"

#   mock_outputs = {
#     cluster_oidc_issuer_url = ""
#     cluster_name = ""
#     cluster_endpoint = ""
#     cluster_certificate_authority_data = ""
#     worker_iam_role_name = ""
#   }
# }

# generate "helm_provider" {
#   path      = "helm-provider.tf"
#   if_exists = "overwrite_terragrunt"
#   contents  = <<EOF

# provider "helm" {
#   kubernetes {
#     host                   = var.cluster_endpoint
#     cluster_ca_certificate = base64decode(var.cluster_certificate_authority_data)
#     exec {
#       api_version = "client.authentication.k8s.io/v1beta1"
#       args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
#       command     = "aws"
#     }
#   }
# }
# EOF
# }