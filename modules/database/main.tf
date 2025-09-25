# Subnet group for RDS
resource "aws_db_subnet_group" "postgres_subnets" {
  name       = var.postgres-subnet-group-name
  subnet_ids = var.subnet_group_ids
  tags = {
    Name = "postgres-subnet-group"
  }
}

# RDS PostgreSQL instance
resource "aws_db_instance" "postgres" {
  identifier        = "${var.env}-postgres-db"
  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class    # db.t3.micro
  allocated_storage = var.allocated_storage  # in GB
  storage_type      = var.storage_type     # gp2 = general purpose SSD

  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.postgres_subnets.name
  vpc_security_group_ids = var.subnet_group_ids_db_sg

  publicly_accessible = false   # change to false if only inside VPC
  skip_final_snapshot = true   # don’t keep snapshot when destroying
  deletion_protection = false
}
