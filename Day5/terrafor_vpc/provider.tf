#terraform
terraform {
  required_version = ">=1.0.0"   #terrform cli version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
   backend "s3" {
    bucket = "bucket-terraform-state-hani"
    key    = "vpc/terraform.tfstate"
    region = "ap-south-1"
    use_lockfile = true 
}
} 

#provide Block 
provider "aws" {
  region = "ap-south-1"
}