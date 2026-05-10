module "modules" {
  source = "./modules/vpc"
   vpc_id = "vpc-02358ddc1cb955bcd"
   nat_gateway_id = "nat-1ddb2b0e7dca2d1bb"
   internet_gateway_id = "igw-095a43d99a5ec72d6"
   public_subnet_cidr = ["10.0.29.0/24","10.0.32.0/24"]
   private_subnet_cidr = ["10.0.129.0/24","10.0.132.0/24"]
   availability_zone = ["ap-south-1a","ap-south-1b"]
}

output "vpc_id" {
  value = module.modules.vpc_id
}

output "private_subnet_ids" {
  value = module.modules.private_subnet_ids
}

output "public_subnet_ids" {
  value = module.modules.public_subnet_ids
}