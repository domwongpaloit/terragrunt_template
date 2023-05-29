module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.3"

  name = "dom-reuseable-terragrunt-vpc-${var.env}"
  cidr = var.vpc_cidr_block

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  public_subnet_tags  = var.public_subnet_tags
  private_subnet_tags = var.private_subnet_tags

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  nat_eip_tags = var.nat_eip_tags

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "dom-reuseable-terragrunt-vpc-${var.env}"
    Environment = "${var.env}",
    Terraform   = true
  }
}
