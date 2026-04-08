import pulumi
import pulumi_aws as aws

instance = aws.ec2.Instance("example",
    instance_type="t3.micro",
    ami="ami-0f9ae750e8274075b",  # Tokyo region
    tags={
        "Name": "pulumi-drift-example",
        "Environment": "dev"
    }
)

pulumi.export("instance_id", instance.id)