import pulumi
import pulumi_aws as aws

# Read config
config = pulumi.Config()
environment = config.get("environment") or "dev"

# Create bucket
bucket = aws.s3.Bucket(
    "example",
    bucket_prefix=f"globalretail-{environment}-"
)