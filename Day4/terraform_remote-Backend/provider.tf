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
    key    = "terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    use_lockfile = true
    }
}

provider "aws" {
  region = var.region
}