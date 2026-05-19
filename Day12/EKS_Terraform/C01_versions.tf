terraform {
  required_version = ">=1.0.0"   #terrform cli version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.38.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 3.1.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "~> 3.5.0"
    } 
    
  }
  backend "s3" {
    bucket = "bucket-terraform-state-hani"
    key    = "eks/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    use_lockfile = true
    }
}


provider "aws" {
  region = var.aws_region
}