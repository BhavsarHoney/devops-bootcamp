module "modules" {
  source = "./modules/vpc"
   vpc_id = "vpc-02358ddc1cb955bcd"
   Nat_gateway_id = "nat-054be5efc41467fef"
   public_subnet_cidr = "10.0.29.0/24"
   private_subnet_cidr = "10.0.129.0/24"
   availability_zone = "ap-south-1a"
}
