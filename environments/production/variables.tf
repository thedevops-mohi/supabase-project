variable "aws_vpc_region" {
  description = "The AWS region where the VPC will be created"
  type        = string
  default     = "us-east-1"
}

variable "aws_vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = ""
}

variable "aws_vpc_enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "aws_vpc_enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "private_zone1_cidr" {
  description = "The CIDR block for the first private subnet"
  type        = string
  default     = ""
}

variable "private_zone2_cidr" {
  description = "The CIDR block for the second private subnet"
  type        = string
  default     = ""
}

variable "public_zone1_cidr" {
  description = "The CIDR block for the first public subnet"
  type        = string
  default     = ""
}

variable "public_zone2_cidr" {
  description = "The CIDR block for the second public subnet"
  type        = string
  default     = ""
}

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
variable "zone2" {
  description = "The second availability zone for the VPC"
  type        = string
  default     = "us-east-1b"
}

variable "eks_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.30"
}


# variable "subnet_node_ids" {
#  type        = list(string)
#  description = "List of subnet IDs for the EKS worker nodes"
# }

# variable "node_role_arn" {
#   description = "The ARN of the IAM role for the EKS worker nodes"
#   type        = string
  
# }

variable "capacity_type" {
  description = "The capacity type for the EKS worker nodes (e.g., ON_DEMAND, SPOT)"
  type        = string
  default     = "SPOT"
}

variable "desired_size" {
  description = "The desired number of worker nodes in the EKS node group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "The maximum number of worker nodes in the EKS node group"
  type        = number
  default     = 10
}

variable "min_size" {
  description = "The minimum number of worker nodes in the EKS node group"
  type        = number
  default     = 0
}

variable "instance_types" {
  description = "List of instance types for the EKS worker nodes"
  type        = list(string)
  default     = ["t3.large"]
  
}

variable "addon_name" {
    description = "The name of the EKS addon to be installed"
    type        = string
    default     = "eks-pod-identity-agent"
}

variable "addon_version" {
    description = "The version of the EKS addon to be installed"
    type        = string
    default     = "v1.3.2-eksbuild.2"
}

variable "bucket_name" {
  description = "The name of the storage bucket."
  type        = string
}

variable "postgres-subnet-group-name" {
  description = "The name of the RDS subnet group"
  type        = string
}


variable "db_username" {
  description = "The username for the RDS instance"
  type        = string
  default     = "admin"
  
}

variable "db_password" {
  description = "The password for the RDS instance"
  type        = string
}

variable "engine" {
  description = "The database engine for the RDS instance"
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  description = "The version of the database engine"
  type        = string
  default     = "15.5"
}

variable "instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "The allocated storage (in GB) for the RDS instance"
  type        = number
  default     = 20
}

variable "storage_type" {
  description = "The storage type for the RDS instance"
  type        = string
  default     = "gp2"  # gp2 = general purpose SSD
}

variable "secret_manager_name" {
  description = "The name of the Secrets Manager secret"
  type        = string
  default     = "supabase-rds-credentials"      
  
}

variable "aws_lbc_helm_name" {
  description = "The name of the Helm release for AWS Load Balancer Controller"
  type        = string
  default     = "aws-load-balancer-controller"
  
}
variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "us-east-1"
  
}