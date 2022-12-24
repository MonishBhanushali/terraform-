#-------------   PUBLIC SUBNETS --------------------
# Crated 2 public subnets using List vaiable for multiple CIDR blocks 
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc_poc.id
  count      = length(var.subnet_cidrs_public)
  cidr_block = var.subnet_cidrs_public[count.index]
  tags = {
    Name = "public_subnet_${count.index + 1}"
  }
}
#---------- In Below code direct values assigned in CIDR BLOCK--------------
# resource "aws_subnet" "public_subnet_2" {
#   vpc_id     = aws_vpc.vpc_poc.id
#   cidr_block = "10.0.2.0/24"
#   tags = {
#     Name = "public_subnet_2"
#   }
# }
