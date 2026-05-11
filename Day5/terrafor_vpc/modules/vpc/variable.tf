variable "vpc_id" {
  type = string
}

# variable "nat_gateway_id" {
#   type = string
# }

variable "internet_gateway_id" {
  type = string
}

variable "public_subnet_cidr" {
  type = list(string)
}

variable "private_subnet_cidr" {
  type = list(string)
}

variable "availability_zone" {
  type = list(string)
}