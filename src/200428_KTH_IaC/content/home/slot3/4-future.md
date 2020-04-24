+++
+++

{{% section %}}

{{< slide template="subtitle" >}}

## Is there a future without YAML?

---

![](images/yaml.JPG)

---

There are build/deployment tools describing and pushing infrastructure changes

---

```yaml
# serverless.yml

service: usersCrud
provider: aws
functions:

resources: # CloudFormation template syntax
  Resources:
    usersTable:
      Type: AWS::DynamoDB::Table
      Properties:
        TableName: usersTable
        AttributeDefinitions:
          - AttributeName: email
            AttributeType: S
        KeySchema:
          - AttributeName: email
            KeyType: HASH
        ProvisionedThroughput:
          ReadCapacityUnits: 1
          WriteCapacityUnits: 1
```

---

We can still consume SDKs/APIs!

---

```go
deployment := &appsv1.Deployment{
		ObjectMeta: metav1.ObjectMeta{
			Name: "demo-deployment",
		},
		Spec: appsv1.DeploymentSpec{
			Replicas: int32Ptr(2),
			Selector: &metav1.LabelSelector{
				MatchLabels: map[string]string{
					"app": "demo",
				},
			},
			Template: apiv1.PodTemplateSpec{
				ObjectMeta: metav1.ObjectMeta{
					Labels: map[string]string{
						"app": "demo",
					},
				},
				Spec: apiv1.PodSpec{
					Containers: []apiv1.Container{
						{
							Name:  "web",
							Image: "nginx:1.12",
							Ports: []apiv1.ContainerPort{
								{
									Name:          "http",
									Protocol:      apiv1.ProtocolTCP,
									ContainerPort: 80,
								},
							},
						},
					},
				},
			},
		},
	}

```

---

And we are also able to generate config programmatically...

---

Terrascript:

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

While we may see Hashicorp reacting to actual "code"

> **AWS CDK** and **Pulumi**

---

<img src="images/infraLayers.png" style="width:68%;">

---

![](https://media.giphy.com/media/QWRiuQHRYM3WLB1zBs/giphy-downsized.gif)


{{% /section %}}
