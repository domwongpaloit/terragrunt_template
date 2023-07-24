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
