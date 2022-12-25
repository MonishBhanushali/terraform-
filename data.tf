data "aws_subnet" "subnet_name"{
    filter {
    name   = "tag:Name"
    values = ["public_subnet_1"]
  }
}

data "aws_security_group" "public_security"{
    filter {
      name = "tag:Name"
      values = ["PublicAccess_Security_group"]
    }
}