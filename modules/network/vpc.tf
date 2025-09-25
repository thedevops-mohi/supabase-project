resource "aws_vpc" "main" {
  cidr_block = var.aws_vpc_cidr

  enable_dns_support   = var.aws_vpc_enable_dns_support
  enable_dns_hostnames = var.aws_vpc_enable_dns_hostnames

  tags = {
    Name                                               = "${var.env}-main"
    "kubernetes.io/cluster/${var.env}-${var.eks_name}" = "shared"
  }
}