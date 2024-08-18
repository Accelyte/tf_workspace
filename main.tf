provider "aws" {
  region = "us-east-1"
}

variable "aws_region" {
  default = "us-east-1"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "aws_s3_bucket" "s3_sample" {
  bucket = "my-terraform-bucket-${terraform.workspace}-${random_string.suffix.result}"
}

output "bucket_name" {
  value = aws_s3_bucket.s3_sample.bucket
}

