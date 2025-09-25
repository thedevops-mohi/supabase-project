
resource "aws_eks_node_group" "general" {
  cluster_name    = aws_eks_cluster.eks.name
  version         = var.eks_version
  node_group_name = "generals"
  node_role_arn   = var.node_role_arn
  

  subnet_ids = var.subnet_node_ids

  capacity_type  = var.capacity_type
  instance_types = var.instance_types

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "generals"
  }

  depends_on = [
    #module.security,
    #module.network,
    aws_eks_cluster.eks,
    #aws_iam_role_policy_attachment.amazon_eks_worker_node_policy,
    #aws_iam_role_policy_attachment.amazon_eks_cni_policy,
    #aws_iam_role_policy_attachment.amazon_ec2_container_registry_read_only,
  ]

  # Allow external changes without Terraform plan difference
  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }
}