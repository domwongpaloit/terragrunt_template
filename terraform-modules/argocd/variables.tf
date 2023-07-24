variable "argocd_values_path" {
  description = "the path of argocd values"
  type        = string
}

variable "argocd_image_updater_values_path" {
  description = "the path of argocd image updater values"
  type        = string
}

variable "chart_museum_values_path" {
  description = "the path of chart museum values"
  type        = string

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
