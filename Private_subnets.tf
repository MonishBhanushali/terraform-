#-------------   PRIVATE SUBNETS ---------------------

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc_poc.id
  count      = length(var.subnet_cidrs_private)
  cidr_block = var.subnet_cidrs_private[count.index]
  tags = {
    Name = "private_subnet_${count.index + 1}"
  }
}
# resource "aws_subnet" "private_subnet_3" {
#   vpc_id     = aws_vpc.vpc_poc.id
#   cidr_block = "10.0.3.0/24"
#   tags = {
#     Name = "private_subnet_3"
#   }
# }

# resource "aws_subnet" "private_subnet_4" {
#   vpc_id     = aws_vpc.vpc_poc.id
#   cidr_block = "10.0.4.0/24"
#   tags = {
#     Name = "private_subnet_4"
#   }
# }