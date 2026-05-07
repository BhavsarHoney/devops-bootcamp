#terraform
terraform {
  required_version = ">=1.0.0"   #terrform cli version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

#provide Block 
provider "aws" {
  region = "ap-south-1"
}