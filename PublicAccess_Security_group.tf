resource "aws_security_group" "PublicAccess_Security_group" {
  name        = "PublicAccess_Security_group"
  description = "The Subnet is accessible for Outer Users so have open ports to access"
  vpc_id      = aws_vpc.vpc_poc.id

  ingress {
    description = " The ports are allowed for users access"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = " The ports are allowed for users access"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "PublicAccess_Security_group"
  }
}

