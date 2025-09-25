resource "aws_eks_addon" "pod_identity" {
  cluster_name  = aws_eks_cluster.eks.name
  addon_name    = var.addon_name
  addon_version = var.addon_version
}


resource "aws_eks_pod_identity_association" "aws_lbc" {
  cluster_name    = var.cluster_name
  namespace       = "kube-system"
  service_account = "aws-load-balancer-controller"
  role_arn        = var.aws_iam_role_aws_lbc_arn
}

resource "aws_eks_addon" "metrics_server" {
  cluster_name  = aws_eks_cluster.eks.name
  addon_name    = "metrics-server"
  addon_version = "v0.8.0-eksbuild.2"
}


resource "aws_eks_addon" "vpc_csi" {
  cluster_name  = aws_eks_cluster.eks.name
  addon_name    = "vpc-cni"
  addon_version = "v1.19.0-eksbuild.1"
}

resource "aws_eks_addon" "ebs_csi" {
  cluster_name  = aws_eks_cluster.eks.name
  addon_name    = "aws-ebs-csi-driver"
  addon_version = "v1.48.0-eksbuild.2"
}

resource "aws_eks_addon" "efs_csi" {
  cluster_name  = aws_eks_cluster.eks.name
  addon_name    = "aws-efs-csi-driver"
  addon_version = "v2.1.11-eksbuild.1"
}

resource "aws_eks_pod_identity_association" "example" {
  cluster_name    = aws_eks_cluster.eks.name
  namespace       = "default"
  service_account = "default"
  role_arn        = var.iam_pod
}