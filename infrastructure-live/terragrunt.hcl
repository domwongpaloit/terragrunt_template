# pre-requirement create your own bucket first
generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "s3" {
    bucket         = "techops-iac-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
    dynamodb_table = "terragrunt-iac-state"
  }
}
EOF
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
provider "aws" {
    region = "ap-southeast-1"
}

terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">=2.6.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.11.0"
    }
  }

  required_version = "~> 1.0"
}

EOF
}