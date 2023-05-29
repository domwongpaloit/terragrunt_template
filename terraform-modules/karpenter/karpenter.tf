# module "iam_assumable_role_karpenter" {
#   source                        = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
#   version                       = "4.7.0"
#   create_role                   = true
#   role_name                     = "karpenter-controller-${var.cluster_name}"
#   provider_url                  = var.cluster_oidc_issuer_url
#   oidc_fully_qualified_subjects = ["system:serviceaccount:karpenter:karpenter"]
# }

# resource "aws_iam_instance_profile" "karpenter" {
#   name = "KarpenterNodeInstanceProfile-${var.cluster_name}"
#   role = var.worker_iam_role_name
# }

# resource "aws_iam_role_policy" "karpenter_controller" {
#   name = "karpenter-policy-${var.cluster_name}"
#   role = module.iam_assumable_role_karpenter.iam_role_name

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = [
#           "ec2:CreateLaunchTemplate",
#           "ec2:CreateFleet",
#           "ec2:RunInstances",
#           "ec2:CreateTags",
#           "iam:PassRole",
#           "ec2:TerminateInstances",
#           "ec2:DescribeLaunchTemplates",
#           "ec2:DescribeInstances",
#           "ec2:DescribeSecurityGroups",
#           "ec2:DescribeSubnets",
#           "ec2:DescribeInstanceTypes",
#           "ec2:DescribeInstanceTypeOfferings",
#           "ec2:DescribeAvailabilityZones",
#           "ssm:GetParameter"
#         ]
#         Effect   = "Allow"
#         Resource = "*"
#       },
#     ]
#   })
# }

# resource "helm_release" "karpenter" {
#   namespace        = "karpenter"
#   create_namespace = true

#   name       = "karpenter"
#   repository = "https://charts.karpenter.sh"
#   chart      = "karpenter"
#   version    = "v0.6.0"

#   set {
#     name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
#     value = module.iam_assumable_role_karpenter.iam_role_arn
#   }

#   set {
#     name  = "controller.clusterName"
#     value = var.cluster_name
#   }

#   set {
#     name  = "controller.clusterEndpoint"
#     value = var.cluster_endpoint
#   }

#   set {
#     name  = "aws.defaultInstanceProfile"
#     value = module.iam_assumable_role_karpenter.
#   }
# }
