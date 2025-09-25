# resource "aws_security_group" "this" {
#     name        = "${var.env}-eks-cluster-sg"
#     description = "Security group for EKS cluster"
#     vpc_id      = module.network.vpc_id
    
#     tags = {
#         Name = "${var.env}-eks-cluster-sg"
#     }
# }

# resource "aws_security_group_rule" "this" {
#     type                     = "ingress"
#     from_port                = 0
#     to_port                  = 0
#     protocol                 = "-1"
#     security_group_id        = aws_security_group.this.id
#     #source_security_group_id = aws_security_group.worker_nodes.id
#     description              = "Allow worker nodes to communicate with the EKS cluster"
#     cidr_blocks = [ module.network.vpc_cidr]
# }

# resource "aws_security_group_rule" "this_egress" {
#     type                     = "egress"
#     from_port                = 0
#     to_port                  = 0
#     protocol                 = "-1"
#     security_group_id        = aws_security_group.this.id
#     cidr_blocks              = ["0.0.0.0/0"]
#     description              = "Allow all outbound traffic from the EKS cluster"
  
# }


# Security group to allow DB access (change CIDR to your IP)
resource "aws_security_group" "rds_sg" {
  name        = "${var.env}-rds-sg"
  description = "Allow PostgreSQL inbound traffic"
  vpc_id      = var.rds_sg_vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = var.allowed_eks # e.g. "0.0.0.0/0" (not safe for prod!)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}