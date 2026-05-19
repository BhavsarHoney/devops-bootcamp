locals {
  Owner       =  var.business_division
  Environment   = var.environment_name
  name = "${local.Owner}-${local.Environment}"
  eks_cluster_name = "${local.name}-eks-cluster-hani"
}