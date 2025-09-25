variable "secret_manager_name" {
  description = "The name of the Secrets Manager secret"
  type        = string
  default     = "supabase-rds-credentials"
  
}
variable "db_username_supabase" {
  description = "The username for the RDS instance"
  type        = string
  default     = "admin"
  
}
variable "db_password_supabase" {
  description = "The password for the RDS instance"
  type        = string
}
variable "supabase_db_endpoint" {
  description = "The endpoint of the Supabase RDS instance"
  type        = string
}

