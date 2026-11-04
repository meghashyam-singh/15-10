terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.72.0"
    }
  }
  backend "s3" {
    bucket = "uygyegue"
    region = "us-east-1"
    key = "15-10/eks-terraform"
    use_lockfile = true
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}