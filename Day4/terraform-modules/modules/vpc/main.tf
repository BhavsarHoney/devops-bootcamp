data "aws_internet_gateway" "bootcamp" {
  # id = "igw-095a43d99a5ec72d6"
  filter {
    name   = "attachment.vpc-id"
    values = [var.vpc_id]
  } 
}

# public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "Hanibhavsar-19-pub-subnet"
    owner= "Haniben.Bhavsar@einfochips.com"
  }
}
# private subnet
resource "aws_subnet" "private" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone

  tags = {
    Name = "Hanibhavsar-19-priv-subnet"
    Owner="Haniben.Bhavsar@einfochis.com"
  }
}

#private route table 
resource "aws_route_table" "hani_private_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.Nat_gateway_id
  }

  tags = {
    Name = "hani_private-rt"

  }
}

#private route table association with private subnet 
resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.hani_private_rt.id
}

#public route table creation 
resource "aws_route_table" "hani_public_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.Nat_gateway_id
  }

  tags = {
    Name = "hani_public-rt"
  }
}

#public route table association with public subnet
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.hani_public_rt.id
}