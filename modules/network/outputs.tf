output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id  
}
# outputs.tf
output "private_subnets" {
  description = "List of private subnet IDs"
  value       = [
    aws_subnet.private_zone1.id,
    aws_subnet.private_zone2.id
  ]
}

output "private_subnets_cidr" {
  description = "List of private subnet IDs"
  value       = [
    aws_subnet.private_zone1.cidr_block,
    aws_subnet.private_zone2.cidr_block
  ]
}

output "public_subnets" {
  description = "List of public subnet IDs"
  value       = [
    aws_subnet.public_zone1.id,
    aws_subnet.public_zone2.id
  ]
}

# output "nat_gateway_id" {
#   description = "The ID of the NAT Gateway"
#   value       = aws_nat_gateway.nat.id
# }

# output "internet_gateway_id" {
#   description = "The ID of the Internet Gateway"
#   value       = aws_internet_gateway.igw.id
# }

