resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id  # Attach the Internet Gateway to the main VPC

  tags = {
    Name = "${var.env}-igw" # Tag for easy identification by environment
  }
}