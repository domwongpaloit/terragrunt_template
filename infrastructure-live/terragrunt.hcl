remote_state {
    backend = "local"
    generate = {
        path = "backend.tf"
        if_exists = "overwrite_terragrunt"
    }

    config = {
        path = "${path_relative_to_include()}/terraform.tfstate"
    }
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
  }

  required_version = "~> 1.0"
}

EOF
}