resource "aws_route_table" "Route_table_Public_subnet" {
  vpc_id = aws_vpc.vpc_poc.id
  tags = {
    "Name" = "Route_table_Public_subnet"
  }
}
resource "aws_route" "Route_table_Public_subnet_Route" {
  route_table_id         = aws_route_table.Route_table_Public_subnet.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id

}

resource "aws_route_table_association" "aws_route_table_PUBLIC_SUBNET_ASSOCIATION" {
  route_table_id = aws_route_table.Route_table_Public_subnet.id
  count          = length(var.subnet_cidrs_public)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)

}