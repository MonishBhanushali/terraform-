data "aws_subnet" "subnet_name" {
  depends_on = [
    aws_subnet.public_subnet
  ]
  filter {
    name   = "tag:Name"
    values = ["public_subnet_1"]
  }
}

data "aws_security_group" "public_security" {
  depends_on = [
    aws_security_group.PublicAccess_Security_group
  ]
  filter {
    name   = "tag:Name"
    values = ["PublicAccess_Security_group"]
  }
}

# data "aws_instance" "ipaddress" {
#   count = 3
#   depends_on = [
#     aws_instance.public
#   ]
#   filter {
#     name   = "tag:Name"
#     values = ["instance${count.index}"]
#   }
# }