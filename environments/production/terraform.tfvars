
env = "production"
//network configuration
aws_vpc_cidr = "10.0.0.0/16"
aws_vpc_enable_dns_support = true
aws_vpc_enable_dns_hostnames = true
private_zone1_cidr = "10.0.0.0/19"
private_zone2_cidr = "10.0.32.0/19"
public_zone1_cidr = "10.0.64.0/19"
public_zone2_cidr = "10.0.96.0/19"
zone1 = "us-east-1a"
zone2 = "us-east-1b"
//end of file

//eks configuration
eks_name = "production-cluster"
eks_version = "1.30"
//end of file

//node group configuration
capacity_type = "SPOT"
instance_types = ["t3.medium"]
desired_size = 2
max_size = 2
min_size = 2
addon_name = "eks-pod-identity-agent"
addon_version = "v1.3.2-eksbuild.2"
//end of file

//S3 configuration
bucket_name = "myproductionsupabasebucket"
//end of file

//RDS configuration
db_username = "adminuser"
db_password = "StrongPassword123!"
engine = "postgres"
engine_version = "17.6"
instance_class = "db.t3.micro"
allocated_storage = 20
storage_type = "gp2"
postgres-subnet-group-name = "production-postgres-subnet-group"
//end of file

//Secret Manager configuration
secret_manager_name = "production-rds-secretgs"
//end of file   

//Supabase configuration    
aws_lbc_helm_name = "aws-load-balancer-controller"
aws_region = "us-east-1"
