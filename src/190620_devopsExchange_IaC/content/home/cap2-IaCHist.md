+++
+++

{{< slide template="subtitle" >}}

## IaC history

---

{{% section %}}

## The AWS journey

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

## Sceptre

```bash
$ sceptre create dev/vpc.yaml

dev/vpc - Creating stack dev/vpc
VirtualPrivateCloud AWS::EC2::VPC CREATE_IN_PROGRESS
dev/vpc VirtualPrivateCloud AWS::EC2::VPC CREATE_COMPLETE
dev/vpc sceptre-demo-dev-vpc AWS::CloudFormation::Stack CREATE_COMPLETE
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

{{% fragment %}} *troposphere, but multilanguage?* {{% /fragment %}}

---

**Summarizing (some) AWS IaC options**

| Tool           | Declarative? | Deployment/Update tool? | Config-driven | Programmatic | Language  |
|----------------|:------------:|:-----------------------:|:-------------:|:------------:|:---------:|
| AWS API        |       N      |            N            |       N       |      Y       |    N/A    |
| Cloudformation |       Y      |       More or less      |       Y       |      N       | JSON/YAML |
| Troposphere    |       Y      |            N            |       N       |      Y       |   Python  |
| Sceptre        |      N/A     |            Y            |      N/A      |     N/A      |    N/A    |
| CDK            |       Y      |            Y            |       N       |      Y       |     *     |
{{% /section %}}

---

{{% section %}}

# GCP...

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

---

## Google deployment manager from code
```python
"""Creates a KMS key."""

def GenerateConfig(context):
  """Generates configuration."""

  key_ring = {
    'name': 'keyRing',
    'type': 'gcp-types/cloudkms-v1:projects.locations.keyRings',
    'properties': {
      'parent': 'projects/' + context.env['project'] + '/locations/' + context.properties['region'],
      'keyRingId': context.env['deployment'] + '-key-ring'
    }
  }
  resources = [key_ring]
  return { 'resources': resources }
```

{{% /section %}}

---

{{% section %}}

## k8s

---

## Manifest example

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.7.9
        ports:
        - containerPort: 80
```

---

![](https://media.giphy.com/media/MnpPCugwALAHsTygpd/giphy-downsized.gif)

---

## Easily becoming

```bash
APPVERSION="$(getAppVersionFromSomewhere)"
kubectl apply -f - <<EOH
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:${APPVERSION}
        ports:
        - containerPort: 80
EOH
```

---

## Helm

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: {{ template "alpine.fullname" . }}
  labels:
    app.kubernetes.io/managed-by: {{ .Release.Service }}
    app.kubernetes.io/instance: {{ .Release.Name | quote }}
    app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
    helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
    app.kubernetes.io/name: {{ template "alpine.name" . }}
spec:
  restartPolicy: {{ .Values.restartPolicy }}
  containers:
  - name: waiter
    image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
    imagePullPolicy: {{ .Values.image.pullPolicy }}
    command: ["/bin/sleep", "9000"]
```

---

## kustomize

`kustomization.yaml`:

```yaml
   commonLabels:
    env: production
   bases:
   - ../../base
   patches:
   - replica_count.yaml
```

`replica_count.yaml`:

```yaml
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: the-deployment
   spec:
     replicas: 100
```

---

## Kapitan

```json
local kube = import "lib/kube.libjsonnet";
local kap = import "lib/kapitan.libjsonnet";
local inv = kap.inventory();
local namespace = inv.parameters.namespace;
local name      = "cod";
local image     = inv.parameters[name].image;
local replicas  = inv.parameters[name].replicas;
local args      = inv.parameters[name].args;
local container = kube.Container(name) {
  image: image,
  args: args
};
kube.Deployment(name) {
  spec+: {
    replicas: replicas,
    template+: { 
      spec+: { 
        containers: [ container ]
      }
    }
  }
}
```

{{% /section %}}

---

{{% section %}}

## Multicloud

---

## Terraform(-v11)

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

## Terrascript (+Terraform-v12)

```python
from terrascript import Terrascript, provider
from terrascript.aws.r import aws_instance

ts = Terrascript()

# Add a provider (+= syntax)
ts += provider('aws', access_key='ACCESS_KEY_HERE',
               secret_key='SECRET_KEY_HERE', region='us-east-1')

# Add an AWS EC2 instance (add() syntax).
inst = ts.add(aws_instance('example', ami='ami-2757f631', instance_type='t2.micro'))

# Print the JSON-style configuration to stdout.
print(ts.dump())
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

---

**Multicloud IaC options summary**

| Tool        | Declarative? | Deployment/Update tool? | Config-driven | Programmatic |     Language    |
|-------------|:------------:|:-----------------------:|:-------------:|:------------:|:---------------:|
| Terraform   |       Y      |            Y            |       Y       |      N       | HCL, JSON(v12)  |
| Terrascript |       Y      |            N            |       N       |      Y       |      Python     |
| Pulumi      |       Y      |            Y            |       N       |      Y       |        *        |

{{% /section %}}
