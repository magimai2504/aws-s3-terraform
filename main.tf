terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.6.0"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "devops_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "Terraform S3 Demo"
    Environment = "dev"
    ManagedBy   = "Terraform"
    Project     = "S3-Terraform"
  }
}

resource "aws_s3_bucket_versioning" "devops_bucket_versioning" {
  bucket = aws_s3_bucket.devops_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "devops_bucket_encryption" {
  bucket = aws_s3_bucket.devops_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "devops_bucket_public_access" {
  bucket = aws_s3_bucket.devops_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}