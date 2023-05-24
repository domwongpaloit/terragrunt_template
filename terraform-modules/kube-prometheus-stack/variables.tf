variable "kube-prometheus-stack-release-name" {
  description = "kube-prometheus-stack-release-name"
  default     = "kube-prometheus-stack"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_endpoint" {
  description = "The endpoint for the EKS control plane API"
  type        = string
}

variable "cluster_certificate_authority_data" {
  description = "module.eks.cluster_certificate_authority_data"
  type        = string
}
