data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "bucket-terraform-state-hani"
    key    = "vpc/terraform.tfstate"
    region = "ap-south-1"
  }
}

#output
output "vpc_id" {
  value = data.terraform_remote_state.vpc.outputs.vpc_id
}

output "private_subnet_ids" {
  value = data.terraform_remote_state.vpc.outputs.private_subnet_ids
}

output "public_subnet_ids" {
  value = data.terraform_remote_state.vpc.outputs.public_subnet_ids
}