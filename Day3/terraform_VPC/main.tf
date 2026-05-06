# public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = data.aws_vpc.example.id
  cidr_block              = "10.0.29.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Hanibhavsar-19-pub-subnet"
    owner= "Haniben.Bhavsar@einfochips.com"
  }
}
# private subnet
resource "aws_subnet" "private" {
  vpc_id            = data.aws_vpc.example.id
  cidr_block        = "10.0.129.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "Hanibhavsar-19-priv-subnet"
    Owner="Haniben.Bhavsar@einfochis.com"
  }
}

#private route table 
resource "aws_route_table" "hani_private_rt" {
  vpc_id = data.aws_vpc.example.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = data.aws_nat_gateway.bootcamp.id
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
  vpc_id = data.aws_vpc.example.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.bootcamp.id
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