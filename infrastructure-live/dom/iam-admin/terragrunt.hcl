terraform {
    source = "../../..//terraform-modules/iam-admin"
}

inputs = {
    vpc_owner_id = dependency.vpc.outputs.vpc_owner_id
}

dependency "vpc" {
  config_path = "../vpc"
  mock_outputs = {
    private_subnets = ["",""]
    vpc_id = ""
    vpc_owner_id = ""
    
  }
}