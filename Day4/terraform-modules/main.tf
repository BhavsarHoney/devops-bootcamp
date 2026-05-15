module "modules" {
  source = "./modules/vpc"
   vpc_id = "vpc-02358ddc1cb955bcd"
   nat_gateway_id = "nat-054be5efc41467fef"
    internet_gateway_id = "igw-0c8b1e7a9c5e4f2b6"
   public_subnet_cidr = "10.0.29.0/24"
   private_subnet_cidr = "10.0.129.0/24"
   availability_zone = "ap-south-1a"
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnet_id" {
  value = module.vpc.private_subnet_ids
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_ids
}