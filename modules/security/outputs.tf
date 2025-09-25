output "iam_role_arn" {
  description = "The ARN of the IAM role for EKS"
  value       = aws_iam_role.eks.arn
  
}

output "aws_iam_role_node_arn" {
  description = "The ARN of the IAM role for EKS nodes"
  value       = aws_iam_role.nodes.arn
  
}

output "aws_security_group" {
  description = "The ID of the security group"
  value       = aws_security_group.rds_sg.id
}

output "aws_iam_role" {
  description = "The ARN of the IAM role for AWS Load Balancer Controller"
  value       = aws_iam_role.aws_lbc.arn
  
}

output "aws_iam_role_pod_s3" {
  description = "The ARN of the IAM role for S3 access"
  value       = aws_iam_role.example1.arn
}

output "pod_identity_role_arn" {
  value = data.aws_iam_role.pod_identity_role.arn
}