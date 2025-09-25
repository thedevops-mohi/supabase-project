# Environment name (e.g., dev, staging, prod)
variable "env" {
  description = "The environment for the VPC (e.g., dev, staging, prod)"
  type        = string
  default     = "staging"
}

# EKS cluster name
variable "eks_name" {
  description = "The name of the EKS cluster associated with the VPC"
  type        = string
  default     = "demo"
}

# First availability zone for resources
variable "zone1" {
  description = "The first availability zone for the VPC"
  type        = string
  default     = "us-east-1a"
}

# Kubernetes version for EKS cluster
variable "eks_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.30"
}

# List of subnet IDs for EKS cluster networking
variable "subnet_ids" {
  type        = list(string)
  description = "List of public subnet IDs for the EKS cluster"
}

# EKS cluster API endpoint
variable "endpoint" {
  description = "The endpoint of the EKS cluster"
  type        = string
}

# EKS cluster certificate authority data (base64 encoded)
variable "certificate_authority_data" {
  description = "The certificate authority data for the EKS cluster"
  type        = string
}

# Authentication token for EKS cluster access
variable "token" {
  description = "The authentication token for the EKS cluster"
  type        = string
}

