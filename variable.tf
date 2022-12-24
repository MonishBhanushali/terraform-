variable "subnet_cidrs_public" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
  type    = list(any)
}

variable "subnet_cidrs_private" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
  type    = list(any)
}

