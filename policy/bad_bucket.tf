resource "aws_s3_bucket" "bad" {
  bucket = "bad-bucket-demo"
  acl    = "public-read"
}