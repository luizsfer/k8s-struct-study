module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.30.3"

  cluster_name                    = var.aws_eks_cluster.cluster_name
  cluster_version                 = var.aws_eks_cluster.cluster_version
  cluster_endpoint_private_access = var.aws_eks_cluster.cluster_endpoint_private_access
  cluster_endpoint_public_access  = var.aws_eks_cluster.cluster_endpoint_public_access

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
  }

  cluster_encryption_config = [{
    provider_key_arn = aws_kms_key.eks.arn
    resources        = ["secrets"]
  }]

  vpc_id     = var.aws_eks_cluster.vpc_id
  subnet_ids = var.aws_eks_cluster.subnets

  # Extend cluster security group rules
  cluster_security_group_additional_rules = var.aws_eks_cluster.cluster_security_group_additional_rules

  # Extend node-to-node security group rules
  node_security_group_additional_rules = var.aws_eks_cluster.node_security_group_additional_rules

  eks_managed_node_group_defaults = {
    iam_role_attach_cni_policy = true
  }

  eks_managed_node_groups = var.aws_eks_cluster.eks_managed_node_groups

  tags = var.aws_eks_cluster.tags
}
