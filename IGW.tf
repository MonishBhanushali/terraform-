resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_poc.id
  tags = {
    Name = "vpc_poc_igw"
  }
}