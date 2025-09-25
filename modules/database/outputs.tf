output "database_endpoint" {
  description = "The endpoint of the RDS PostgreSQL instance"
  value       = aws_db_instance.postgres.endpoint
  
}

output "database_id" {
  description = "The ID of the RDS PostgreSQL instance"
  value       = aws_db_instance.postgres.id
  
}

output "database_address" {
  description = "The address of the RDS PostgreSQL instance"
  value       = aws_db_instance.postgres.address
}

output "database_port" {
  description = "The port of the RDS PostgreSQL instance"
  value       = aws_db_instance.postgres.port
}

output "database_name" {
  description = "The name of the RDS PostgreSQL instance"
  value       = aws_db_instance.postgres.db_name
}

output "database_username" {
  description = "The username for the RDS PostgreSQL instance"
  value       = aws_db_instance.postgres.username
}

output "database_password" {
  description = "The password for the RDS PostgreSQL instance"
  value       = aws_db_instance.postgres.password
  
}

output "db_subnet_group_name" {
  description = "The name of the RDS subnet group"
  value       = aws_db_subnet_group.postgres_subnets.name
}
