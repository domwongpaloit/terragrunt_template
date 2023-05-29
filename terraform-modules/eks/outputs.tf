output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "The endpoint for the EKS control plane API"
  value       = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "module.eks.cluster_certificate_authority_data"
  value       = module.eks.cluster_certificate_authority_data
  sensitive   = true
}

output "cluster_oidc_issuer_url" {
  description = "cluster_oidc_issuer_url"
  value       = module.eks.cluster_oidc_issuer_url
}
