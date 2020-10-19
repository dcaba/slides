+++
+++

{{% section %}}

{{< slide template="subtitle" >}}

## PaaS?

---

They normally come with build/deployment tools describing and pushing infrastructure changes

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

{{% /section %}}
