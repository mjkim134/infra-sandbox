# terraform configure
terraform {
  required_version = ">= 1.14.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# terraform provider
provider "aws" {
  region = var.aws_region
}

# terraform s3 resource for backend
resource "aws_s3_bucket" "tfstate" {
  bucket = "mjkim134-tfstate-bucket"
}

resource "aws_s3_bucket_versioning" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id
  versioning_configuration {
    status = "Enabled"
  }
}

variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "ap-northeast-2"
}