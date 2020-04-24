+++
+++

{{% section %}}

{{< slide template="subtitle" >}}

## IaC and Cloud

---

### IaC and Cloud

|  |
|---|
| RAW IaC and SDKs |
| Playing with stacks |
| Stacks management with code |
| Multi-Cloud |

{{% /section %}}

---

{{% section %}}

## RAW IaC and SDKs

---

## CLIs and scripting

```bash
#!/bin/bash

aws elb create-load-balancer --load-balancer-name MyLoadBalancer \
  --listeners "Protocol=HTTP,LoadBalancerPort=80,InstanceProtocol=HTTP,InstancePort=80" \
  --availability-zones us-east-1a

for i in `seq 1 2`; do
  EC2_RUN_RESULT=$(ec2-run-instances --instance-type t2.micro --group default --region us-east-1 --key $EC2_INSTANCE_KEY --user-data-file instance_installs.sh ami-5244a300)
  INSTANCE_NAME=$(echo ${EC2_RUN_RESULT} | sed 's/RESERVATION.*INSTANCE //' | sed 's/ .*//')$i
  times=0
  echo
  while [ 5 -gt $times ] && ! ec2-describe-instances $INSTANCE_NAME | grep -q "running"
  do
    times=$(( $times + 1 ))
    echo Attempt $times at verifying $INSTANCE_NAME is running...
  done
  if [ 5 -eq $times ]; then
    echo Instance $INSTANCE_NAME is not running. Exiting...
    exit
  fi

  aws elb register-instances-with-load-balancer --load-balancer-name MyLoadBalancer --instances $INSTANCE_NAME
done
```

---

## API calls

```python
import boto3

s3 = boto3.client('s3')
bucket_name = 'my-bucket'
s3.create_bucket(bucket_name)
filename = 'file.txt'
s3.upload_file(filename, bucket_name, filename)
```

{{% /section %}}

---

{{% section %}}

## Playing with stacks

---

## Cloudformation

```json
{
    "AWSTemplateFormatVersion": "2010-09-09",
    "Resources": {
        "S3Bucket": {
            "Type": "AWS::S3::Bucket"
        },
    },
    "Outputs": {
        "S3BucketSecureURL": {
            "Value": {
                "Fn::Join": [
                    "",
                    [
                        "https://",
                        {
                            "Fn::GetAtt": [
                                "S3Bucket",
                                "DomainName"
                            ]
                        }
                    ]
                ]
            },
            "Description": "Name of S3 bucket"
        }
    }
}
```

---

## Google deployment manager

```yaml
resources:
- type: storage.v1.bucket
  name: test-bucket
  properties:
    project: my-project
    name: test-bucket-name
```

{{% /section %}}

---

{{% section %}}

## Stacks management with code

---

## Troposphere

```python
from troposphere
import Output, Ref, Template
from troposphere.s3
import Bucket, PublicRead

t = Template()

t.add_description(
  "AWS CloudFormation Sample Template”

s3bucket = t.add_resource(Bucket("S3Bucket", AccessControl = PublicRead, ))

t.add_output(Output(
  "BucketName",
  Value = Ref(s3bucket),
  Description = "Name of S3 bucket to hold website content"
))

print(t.to_json())
```

---

## AWS CDK

Amazon Cloud Development Kit

```python
from aws_cdk import (
    aws_s3 as s3,
    cdk
)

bucket = s3.Bucket(self,
    "MyFirstBucket",
    versioned=True,
    encryption=s3.BucketEncryption.KmsManaged,)
```

{{% fragment %}} *troposphere, but multi-language plus "building blocks"* {{% /fragment %}}

{{% /section %}}

---

{{% section %}}

## Multi-Cloud

---

## Terraform

```hcl
provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-test-s3-terraform-bucket"
  acl = "private"
  versioning {
    enabled = true
  }

  tags {
    Name = "my-test-s3-terraform-bucket"
  }
}
```

---

## Pulumi

```go
package main
import (
    "github.com/pulumi/pulumi-gcp/sdk/go/gcp/storage"
    "github.com/pulumi/pulumi/sdk/go/pulumi"
)

func main() {
    pulumi.Run(func(ctx *pulumi.Context) error {
        // NewBucket already adds a random suffix
        bucket, err := storage.NewBucket(ctx, "pulumi-bucket", &storage.BucketArgs{
            Location: "EU",
            })
        if err != nil {
            return err
        }
        ctx.Export("bucketName", bucket.ID())
        ctx.Export("websiteUrl", bucket.Url())
        return nil
    })
}
```

{{% /section %}}
