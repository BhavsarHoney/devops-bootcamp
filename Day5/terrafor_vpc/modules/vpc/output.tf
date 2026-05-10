output "vpc_id" {
  value = var.vpc_id
}
output "public_subnet_ids" {
  value = values(aws_subnet.public)[*].id
}

output "private_subnet_ids" {
  value = values(aws_subnet.private)[*].id
}

output "public_route_table_id" {
  value = aws_route_table.hani_public_rt.id
}

output "private_route_table_id" {
  value = aws_route_table.hani_private_rt.id
}

output "internet_gateway_id" {
  value = var.internet_gateway_id
}

output "nat_gateway_id" {
  value = var.nat_gateway_id
}
