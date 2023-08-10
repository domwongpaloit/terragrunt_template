module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.14.0"

  cluster_name    = "${var.env}-${var.eks_name}"
  cluster_version = "1.26"

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnets

  enable_irsa = var.enable_irsa

  eks_managed_node_group_defaults = var.eks_managed_node_group_defaults

  eks_managed_node_groups = var.eks_managed_node_groups

  tags = {
    Environment = var.env,
    Terraform   = true
  }
}

module "eks_blueprints_addons" {
  source  = "aws-ia/eks-blueprints-addons/aws"
  version = "1.5.0" #ensure to update this to the latest/desired version

  cluster_name      = module.eks.cluster_name
  cluster_endpoint  = module.eks.cluster_endpoint
  cluster_version   = module.eks.cluster_version
  oidc_provider_arn = module.eks.oidc_provider_arn

  enable_karpenter = true

  tags = {
    Environment = var.env,
    Terraform   = true
  }
}

provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
      command     = "aws"
    }
  }
}
