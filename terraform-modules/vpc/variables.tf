variable "env" {
  description = "Environment"
  type        = string
  # value       = "dev"
}

variable "name" {
  description = "App name"
  type        = string
}

variable "vpc_cidr_block" {
  description = "cidr"
  type        = string
  # value       = "10.0.0.0/16"
}

variable "azs" {
  description = "Avability Zone"
  type        = list(string)
  # value       = ["us-east-1a", "us-east-1b"]
}

variable "private_subnets" {
  description = "Private Subnets"
  type        = list(string)
  # value       = ["10.0.0.0/19", "10.0.32.0/19"]

}

variable "public_subnets" {
  description = "Public Subnets"
  type        = list(string)
  # value       = ["10.0.64.0/19", "10.0.96.0/19"]
}

variable "private_subnet_tags" {
  description = "Private subnet tags"
  type        = map(any)
  # value = {
  #   "kubernetes.io/role/internal-elb" = 1
  #   "kubernetes.io/cluster/dev-demo"  = "owned"
  # }
}

variable "public_subnet_tags" {
  description = "Public subnet tags"
  type        = map(any)
  # value = {
  #   "kubernetes.io/role/elb"         = 1
  #   "kubernetes.io/cluster/dev-demo" = "owned"
  # }
}

variable "nat_eip_tags" {
  description = "nat eip tags"
  type        = map(any)
  # value = {
  #   "Name" : "${var.env}-nat"
  # }
}
