package main

# Deny if bucket has public ACL (public-read)
deny[msg] {
  resource := input.resource.aws_s3_bucket[_]
  resource.acl == "public-read"

  msg := sprintf("Bucket %v cannot be public-read", [resource.bucket])
}

# Deny if encryption is not enabled
deny[msg] {
  resource := input.resource.aws_s3_bucket[_]
  not resource.server_side_encryption_configuration

  msg := sprintf("Bucket %v must have encryption enabled", [resource.bucket])
}