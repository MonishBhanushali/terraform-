# ----------- Below Code will create EC2 instances  in all public subnets as per their count -------------------------
# resource "aws_instance" "public" {
#     instance_type = "t2.micro"
#     ami = "ami-0f9d9a251c1a44858"
#     key_name = "mumbai"
#     count      = length(var.subnet_cidrs_public)
#     subnet_id = aws_subnet.public_subnet[count.index].id
#   tags = {
#     "Name" = "public"
#   }
# }

#-------BELOW IN PUBLIC_KEY PLEASE CREATE YOUR OWN PUBLIC_PRIVATE KEY PAIR IN PUTTY_GEN--------
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCLyLf9GFOpnw17JDua2pePgWu+7AlER71wp2V2Gxh2IP++0yD9gi+iExLzclP09rYkAdzcieO4K4OjmlsmCNdZiyt++M4PZj0uJawY/uHf31TinHMZkmyqDlNAIyMn+4+UkLGwH3NkL6MKZOkwut8xAbZlBhtvSIKXnFqSczDXoDgfptiU0lTBa7oK8SDvAritz0SwIO6/2vdMGxctNjX30OmAC5Q8kgOQi1T6tKpOIaRcjmxv+E0TXWc3KVngzCZ6ju4nKYIaFFQRPbgcb/XQA8BTDhqusW3CEcRAfzS4U2ZXIWVxMMFlilLbpr8RoJG40cU7zJnqJMS/vV2GxfHX rsa-key-20221225"
}

resource "aws_instance" "public" {
  count                       = 3
  instance_type               = "t2.micro"
  ami                         = "ami-0f9d9a251c1a44858"
  key_name                    = aws_key_pair.deployer.key_name
  subnet_id                   = data.aws_subnet.subnet_name.id # Here DATA SOURCE BEEN USED TO GET THE VALUES OF SUBNET FROM ARCHITECTURE
  security_groups             = [data.aws_security_group.public_security.id]
  associate_public_ip_address = true
  tags = {
    Name = "instance${count.index}"
  }
}

