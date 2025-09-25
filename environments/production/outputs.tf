# VPC Outputs
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.network.vpc_id
}

# Private Subnet CIDR Outputs
output "private_subnets_cidr_zone1" {
  description = "CIDR block of private subnet in zone 1"
  value       = module.network.private_subnets_cidr[0]
}

output "private_subnets_cidr_zone2" {
  description = "CIDR block of private subnet in zone 2"
  value       = module.network.private_subnets_cidr[1]
}

# Private Subnet ID Outputs
output "private_subnets_zone1" {
  description = "ID of private subnet in zone 1"
  value       = module.network.private_subnets[0]
}

output "private_subnets_zone2" {
  description = "ID of private subnet in zone 2"
  value       = module.network.private_subnets[1]
}

# Public Subnet ID Outputs
output "public_subnets_zone1" {
  description = "ID of public subnet in zone 1"
  value       = module.network.public_subnets[0]
}

output "public_subnets_zone2" {
  description = "ID of public subnet in zone 2"
  value       = module.network.public_subnets[1]
}

# IAM Role Outputs
output "iam_role_arn" {
  description = "The ARN of the IAM role for EKS"
  value       = module.security.iam_role_arn
}

# EKS Cluster Outputs
output "aws_eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.aws_eks_cluster_name
}

output "aws_eks_cluster_endpoint" {
  description = "The endpoint of the EKS cluster"
  value       = module.eks.aws_eks_cluster_endpoint
}

output "aws_eks_cluster_certificate_authority_data" {
  description = "The certificate authority data for the EKS cluster"
  value       = module.eks.aws_eks_cluster_certificate_authority_data
}

output "aws_eks_cluster_version" {
  description = "The Kubernetes version of the EKS cluster"
  value       = module.eks.aws_eks_cluster_version
}

output "aws_iam_role_node_arn" {
  description = "The ARN of the IAM role for EKS nodes"
  value       = module.security.aws_iam_role_node_arn
}

# S3 Bucket Output
output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = module.storage.bucket_name
}

# Database Outputs
output "database_endpoint" {
  description = "The endpoint of the RDS PostgreSQL instance"
  value       = module.database.database_endpoint
}

output "database_id" {
  description = "The identifier of the RDS PostgreSQL instance"
  value       = module.database.database_id
}

output "database_address" {
  description = "The address of the RDS PostgreSQL instance"
  value       = module.database.database_address
}

output "database_port" {
  description = "The port of the RDS PostgreSQL instance"
  value       = module.database.database_port
}

output "database_name" {
  description = "The name of the RDS PostgreSQL instance"
  value       = module.database.database_name
}

output "database_username" {
  description = "The username for the RDS PostgreSQL instance"
  value       = module.database.database_username
}

output "db_subnet_group_name" {
  description = "The name of the RDS subnet group"
  value       = module.database.db_subnet_group_name
}
