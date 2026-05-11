data "aws_internet_gateway" "bootcamp" {
  # id = "igw-095a43d99a5ec72d6"
  filter {
    name   = "attachment.vpc-id"
    values = [var.vpc_id]
  } 
}

# public Subnet
resource "aws_subnet" "public" {
    for_each = toset(var.public_subnet_cidr)
  vpc_id                  = var.vpc_id
  cidr_block              = each.value
  availability_zone       = element(var.availability_zone, index(var.public_subnet_cidr, each.value))
  map_public_ip_on_launch = true

  tags = {
    Name = "Hanibhavsar-19-pub-subnet"
    owner= "Haniben.Bhavsar@einfochips.com"
  }
}
# private subnet
resource "aws_subnet" "private" {
    for_each = toset(var.private_subnet_cidr)
  vpc_id            = var.vpc_id
  cidr_block        = each.value
  availability_zone = element(var.availability_zone, index(var.private_subnet_cidr, each.value))

  tags = {
    Name = "Hanibhavsar-19-priv-subnet"
    Owner="Haniben.Bhavsar@einfochis.com"
  }
}

#private route table 
resource "aws_route_table" "hani_private_rt" {
  vpc_id = var.vpc_id

  # route {
  #   cidr_block     = "0.0.0.0/0"
  #   # nat_gateway_id = var.nat_gateway_id
  # }

  tags = {
    Name = "hani_private-rt"

  }
}

#private route table association with private subnet 
resource "aws_route_table_association" "private_assoc" {
  for_each = aws_subnet.private
  subnet_id      = each.value.id
  route_table_id = aws_route_table.hani_private_rt.id
}

#public route table creation 
resource "aws_route_table" "hani_public_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = "hani_public-rt"
  }
}

#public route table association with public subnet
resource "aws_route_table_association" "public_assoc" {
  for_each = aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.hani_public_rt.id
}