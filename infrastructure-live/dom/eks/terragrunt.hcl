terraform {
    source = "../../..//terraform-modules/eks"
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
    env = include.env.locals.env
    eks_name = "${include.env.locals.name}-eks-demo"
    subnet_ids = dependency.vpc.outputs.private_subnets

    eks_managed_node_group_defaults = {
            instance_types = ["c3.xlarge"]
        }

    eks_managed_node_groups = {
            eks_node = {
                min_size     = 1
                max_size     = 10
                desired_size = 1
                instance_types = ["c3.xlarge"]
                capacity_type  = "ON_DEMAND"
            }
        }
        
    vpc_id = dependency.vpc.outputs.vpc_id
    private_subnets = dependency.vpc.outputs.private_subnets
}

dependency "vpc" {
  config_path = "../vpc"
  mock_outputs = {
    private_subnets = ["",""]
    vpc_id = ""
  }
}