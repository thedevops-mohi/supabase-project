variable "env" {
  description = "The environment for the VPC (e.g., dev, staging, prod)"
  type        = string
  default     = "staging"   
  
}

variable "postgres-subnet-group-name" {
  description = "The name of the RDS subnet group"
  type        = string
}

variable "subnet_group_ids" {
  description = "List of subnet IDs for the RDS subnet group"
  type        = list(string)
  
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

variable "subnet_group_ids_db_sg" {
    description = "List of security group IDs for the RDS instance"
    type        = list(string)
}