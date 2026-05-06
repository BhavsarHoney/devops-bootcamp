output "vpc_id" {
  value = data.aws_vpc.example
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "public_route_table_id" {
  value = aws_route_table.hani_public_rt.id
}

output "private_route_table_id" {
  value = aws_route_table.hani_private_rt.id
}

output "internet_gateway_id" {
  value = data.aws_internet_gateway.bootcamp.id
}

output "nat_gateway_id" {
  value = data.aws_nat_gateway.bootcamp.id
}