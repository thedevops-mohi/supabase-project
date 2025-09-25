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