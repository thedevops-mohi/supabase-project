resource "aws_secretsmanager_secret" "rds_secret" {
  name        = var.secret_manager_name
  description = "RDS credentials for Supabase Postgres"
}

# --- Secret Value (JSON with creds) ---
resource "aws_secretsmanager_secret_version" "rds_secret_value" {
  secret_id     = aws_secretsmanager_secret.rds_secret.id
  secret_string = jsonencode({
    username = var.db_username_supabase
    password = var.db_password_supabase
    host     = var.supabase_db_endpoint
    
  })
}