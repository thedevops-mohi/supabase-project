terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.13"
    }
  }

# Remote backend configuration for storing Terraform state in S3
backend "s3" { 
    bucket         = "vault-mdeey-my-terraform-state-bucket" # S3 bucket for state storage
    key            = "production/terraform.tfstate"          # Path within the bucket for the state file
    region         = "us-east-1"                             # Update if your bucket is in a different region
    encrypt        = true                                    # Enable server-side encryption
    # dynamodb_table = "terraform-locks"                     # Optional: for state locking (create this table if needed)
  }

}



# Helm provider configuration for deploying charts to the EKS cluster.
provider "helm" {
  kubernetes {
    host                   = module.eks.aws_eks_cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.aws_eks_cluster_certificate_authority_data)

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args        = ["eks", "get-token", "--cluster-name", module.eks.aws_eks_cluster_name]
    }
  }
}

# Network module: provisions VPC, subnets, NAT gateways, and route tables.
# Variables set here define the environment, AZs, CIDR blocks, and VPC DNS settings.
module "network" {
  source = "../../modules/network"

  env                = var.env
  zone1              = var.zone1
  zone2              = var.zone2
  private_zone1_cidr = var.private_zone1_cidr
  private_zone2_cidr = var.private_zone2_cidr
  public_zone1_cidr  = var.public_zone1_cidr
  public_zone2_cidr  = var.public_zone2_cidr
  aws_vpc_enable_dns_support   = var.aws_vpc_enable_dns_support
  aws_vpc_enable_dns_hostnames = var.aws_vpc_enable_dns_hostnames
  aws_vpc_cidr                 = var.aws_vpc_cidr
}

# Security module: manages IAM roles, policies, and security groups for EKS and RDS.
# Passes VPC ID and subnet CIDRs for security group configuration.
module "security" {
  source = "../../modules/security" 
  env = var.env
  rds_sg_vpc_id = module.network.vpc_id
  allowed_eks = module.network.private_subnets_cidr
}

# EKS module: provisions the EKS cluster and node groups.
# Uses outputs from network and security modules for cluster and node configuration.
# Variables include cluster name, version, node group settings, and IAM roles.
module "eks" {
  source = "../../modules/eks"
  env = var.env
  eks_name = var.eks_name
  role_arn = module.security.iam_role_arn
  eks_version = var.eks_version
  subnet_ids = module.network.private_subnets
  node_role_arn = module.security.aws_iam_role_node_arn
  subnet_node_ids = module.network.private_subnets
  capacity_type = var.capacity_type
  instance_types = var.instance_types
  desired_size = var.desired_size
  max_size = var.max_size
  min_size = var.min_size
  addon_name = var.addon_name
  addon_version = var.addon_version
  aws_iam_role_aws_lbc_arn = module.security.aws_iam_role
  cluster_name = module.eks.aws_eks_cluster_name
  iam_pod = "arn:aws:iam::[ACCOUNT_ID]:role/eks-pod-identity-role"

  depends_on = [ module.network, module.security ]
}

# Storage module: provisions S3 buckets and other storage resources.
# Passes bucket name as a variable.
module "storage" {
  source = "../../modules/storage"
  bucket_name = var.bucket_name
}

# Database module: provisions RDS/Aurora and related resources.
# Uses network and security outputs for subnet groups and security groups.
# Variables include DB credentials, engine, version, and storage settings.
module "database" {
  source = "../../modules/database"
  env = var.env
  db_username = var.db_username
  db_password = var.db_password
  subnet_group_ids = module.network.private_subnets
  postgres-subnet-group-name = var.postgres-subnet-group-name
  engine = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class
  allocated_storage = var.allocated_storage
  storage_type = var.storage_type
  subnet_group_ids_db_sg = [module.security.aws_security_group]
}

# Secret Manager module: manages AWS Secrets Manager integration for storing DB credentials.
# Uses outputs from the database module for secret values.
module "secret_manager" {
  source = "../../modules/secret-manager"
  db_username_supabase = module.database.database_username
  db_password_supabase = module.database.database_password
  supabase_db_endpoint = module.database.database_address
  secret_manager_name = var.secret_manager_name

  depends_on = [module.database]            
}

# Helm module: installs controllers and drivers using Helm charts.
# Passes cluster info, VPC ID, region, and certificate authority data.
module "helm" {
  source = "../../modules/helm"
  aws_lbc_helm_name = var.aws_lbc_helm_name
  value_eks_name = module.eks.aws_eks_cluster_name
  endpoint = module.eks.aws_eks_cluster_endpoint
  vpc_id = module.network.vpc_id
  aws_region = var.aws_region
  certificate_authority_data = module.eks.aws_eks_cluster_certificate_authority_data

  depends_on = [module.eks, module.security]
}