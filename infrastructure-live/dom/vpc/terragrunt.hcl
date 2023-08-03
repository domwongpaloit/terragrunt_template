terraform {
    source = "../../..//terraform-modules/vpc"
}

include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path           = find_in_parent_folders("env.hcl")
  expose         = true
  merge_strategy = "no_merge"
}

inputs = {
  env             = include.env.locals.env
  name            = include.env.locals.name
  azs             = ["ap-southeast-1a", "ap-southeast-1b"]
  vpc_cidr_block  = "10.0.0.0/16"
  private_subnets = ["10.0.0.0/19", "10.0.32.0/19"]
  public_subnets  = ["10.0.64.0/19", "10.0.96.0/19"]

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
    "kubernetes.io/cluster/${include.env.locals.env}-${include.env.locals.name}-eks-demo"  = "owned"
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb"         = 1
    "kubernetes.io/cluster/${include.env.locals.env}-${include.env.locals.name}-eks-demo" = "owned"
  }
  nat_eip_tags = {
    "Name" : "${include.env.locals.env}-${include.env.locals.name}-nat"
  }
}