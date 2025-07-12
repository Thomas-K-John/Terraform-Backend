# This file contains the Terraform and provider blocks to configure remote state storage in AWS S3 and state locking using DynamoDB.
resource "aws_s3_bucket" "state_bucket" {
  bucket              = "thomaskjohn-state-backend"
  region              = var.region
  object_lock_enabled = "true"
  tags = {
    Name = "S3 Remote Terraform State Store"
  }
}
resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
  bucket = aws_s3_bucket.state_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
