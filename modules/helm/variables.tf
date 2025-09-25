variable "value_eks_name" {
  description = "The name of the EKS cluster"
  type        = string
  
}

variable "aws_lbc_helm_name" {
  description = "The name of the AWS Load Balancer Controller Helm release"
  type        = string
  default     = "aws-load-balancer-controller"  
  
}

variable "endpoint" {
  description = "The endpoint of the EKS cluster"
  type        = string
  
}

variable "certificate_authority_data" {
  description = "The certificate authority data for the EKS cluster"
  type        = string

}

variable "vpc_id" {
    description = "The ID of the VPC"
    type        = string
}

variable "aws_region" {
  description = "The AWS region"
  type        = string
  
}