provider "aws" {
  region = "ap-northeast-1"
}
# test PR
# 🔹 Add random suffix for unique bucket name
resource "random_id" "suffix" {
  byte_length = 4
}

# 🔹 S3 bucket with unique name
resource "aws_s3_bucket" "good_bucket" {
  bucket = "my-secure-bucket-${random_id.suffix.hex}"

  tags = {
    Environment = "dev"
    Project     = "terraform-policy-lab"
  }
}

# 🔹 Enable encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.good_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}