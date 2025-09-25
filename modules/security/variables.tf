variable "env" {
  description = "The environment for the VPC (e.g., dev, staging, prod)"
  type        = string
  default     = "staging"
}

variable "eks_name" {
  description = "The name of the EKS cluster associated with the VPC"
  type        = string
  default     = "demo"
}

variable "zone1" {
  description = "The first availability zone for the VPC"
  type        = string
  default     = "us-east-1a" 
}

variable "eks_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.30"
}

# variable "subnet_node_ids" {
#   type        = list(string)
#   description = "List of private subnet IDs for the EKS node group"
# }


variable "rds_sg_vpc_id" {
  description = "The ID of the existing VPC"
  type        = string
}

variable "allowed_eks" {
  description = "The name of the RDS security group"
  type        = list(string)
}

variable "aws_lbc" {
  description = "The name of the IAM role for the AWS Load Balancer Controller"
  type        = string
  default     = "aws-load-balancer-controller-role"
  
}

variable "pod_id_s3" {
  description = "The pod ID for the S3 access"
  type        = string
  default     = "s3-access"     
  
}