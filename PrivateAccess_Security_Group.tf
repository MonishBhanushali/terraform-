resource "aws_security_group" "PrivateAccess_Security_group" {
  name        = "PrivateAccess_Security_group"
  description = "The Subnet is accessible for Internal Users so have ports to Internal Access"
  vpc_id      = aws_vpc.vpc_poc.id
  ingress {
    description = " The ports are allowed for Internal users access"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    //cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]
    cidr_blocks = var.subnet_cidrs_public
  }

  tags = {
    Name = "PrivateAccess_Security_group"
  }
}

