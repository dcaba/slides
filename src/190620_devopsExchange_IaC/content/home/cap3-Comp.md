+++
+++

{{% section %}}

{{< slide template="subtitle" >}}

## Comparing approaches

---

How IaC looks like with...

{{% fragment %}}**Terraform 0.11 vs Pulumi 0.17** {{% /fragment %}}

{{% fragment %}}![](https://media.giphy.com/media/u4th4weIsJfuE/200w_d.gif){{% /fragment %}}

---

{{< slide class="code-side-by-side" >}}

## Ex1: Bucket creation

```hcl
resource "google_storage_bucket" "terraform-bucket" {
 name     = "terraform-bucket-${random_id.suffix.dec}"
 location = "EU"

 website {
   main_page_suffix = "index.html"
   not_found_page   = "404.html"
 }
}
```

```go
bucket, err := storage.NewBucket(ctx, "pulumi-bucket", &storage.BucketArgs{
    Location: "EU",
    Websites: []map[string]string{
        map[string]string{
            "main_page_suffix": "index.html",
            "not_found_page":   "404.html",
        },
    },
})
```

---

## Hardcoding provider specific configs...

```hcl
resource "google_container_cluster" "stackstorm-cluster" {
 name               = "stackstorm-${var.environment}"
 zone               = "us-central1-a"
 min_master_version = "${data.google_container_engine_versions.central1a.latest_node_version}"
 node_version       = "${data.google_container_engine_versions.central1a.latest_node_version}"
 lifecycle {
   ignore_changes = ["node_pool"]
 }
 node_pool {
   name = "default-pool"
 }

 additional_zones = [
  "us-central1-b",
  "us-central1-c",
  "us-central1-f",
 ]
}
```

---

## Code can use helpers!

```pulumi
func getClusterCfg(baseZone string) (*container.ClusterArgs, error) {
    allZonesInSameRegion, err := getAllZonesInSameRegionThan(baseZone)
    if err != nil {
        return nil, err
    }
    
    return &container.ClusterArgs{
        AdditionalZones:       removeZone(allZonesInSameRegion, baseZone),
        InitialNodeCount:      initialNodeCountPerZone,
        RemoveDefaultNodePool: true,
    }, nil
}
```

---

## Control statements

And some data manipulation:

```hcl
resource "aws_instance" "example" {
    count = 2
    ami = "ami-2d39803a"
    instance_type = "t2.micro"
    availability_zone = "${element(compact(split(",", replace(join(",",var.azs), "eu-west-1b", ""))), count.index)}"
    tags {
        Name = "example-${count.index}"
    }
}
```
```hcl
resource "aws_eip" "example" {
count = "${length(aws_instance.example.*.id)}"
instance = "${element(aws_instance.example.*.id, count.index)}"
}
```

---

## Pulumi


{{% fragment %}}<img src=https://i.kym-cdn.com/photos/images/newsfeed/000/343/462/79a.gif style="width:30%;"> <br>*Control statements like a sir*{{% /fragment %}}

---

```go
pulumi.Run(func(ctx *pulumi.Context) error {
    zones, err := getAllZonesInSameRegionThan("us-central1")
    if err != nil {
        return err
    }
    for i, zone := range zones {
        if zone == "us-central1-f" {
            continue
        }
        if _, err := compute.NewInstance(ctx, "pulumi-demo-instance-"+zone, getMyInstanceArgs(zone));
        err != nil {
            return err
        }
        if _, err = serviceAccount.NewAccount(ctx, "pulumiinstance-sc-"+zone, getMySCArgs(i));
        err != nil {
            return err
        }
    }
    return nil
})
```

---

## Pulumi and Docker

```typescript
const image2 = new docker.Image("build-multistage", {
    imageName: ecr2.repositoryUrl,
    build: {
        context: "./app",
        dockerfile: "./app/Dockerfile-multistage",
        cacheFrom: { stages: ["build"] },
    },
    registry: getImageRegistry(ecr2),
});
```

---

## Pulumi and k8s

```python
labels = { 'app': 'canary-{0}-{1}'.format(get_project(), get_stack()) }
canary = Deployment('canary',
    spec={
        'selector': { 'matchLabels': labels },
        'replicas': 1,
        'template': {
            'metadata': { 'labels': labels },
            'spec': { 'containers': [{ 'name': 'nginx', 'image': 'nginx' }] },
        },
    }, __opts__=ResourceOptions(provider=k8s_provider)
)

ingress = Service('ingress',
    spec={
        'type': 'LoadBalancer',
        'selector': labels,
        'ports': [{'port': 80}],
    }, __opts__=ResourceOptions(provider=k8s_provider)
)
```

---

**So app delivery is also a possibility with pulumi**

---

## And there are more advantages of using Code!

* Abstraction, re-usability and extensibility via standard programming languages capabilities
  * *Inheritance-mixins, interfaces, closures...*
  * *Modules, packages, dep management...*
* Testing
  * [*Pulumi and testing blog post*](https://blog.pulumi.com/testing-your-infrastructure-as-code-with-pulumi)
* Config pre-checks
* Clean code practices

---

## But...

![](https://media.giphy.com/media/26vUSW6H21dmu2ofK/giphy.gif)

---

* Pulumi is a quite complex piece of software
  * Core daemon + cmd gRPC clients
* ... so extending/contributing may be more challenging
* Different programming languages
  * In different maturity status
* References between stacks/elements can be tricky
* Stacks state storage limited to filesystem or their platform

---

## While in terraform

* Almost a standard
* 0.12 comes with lots of presents
  * loops
  * JSON support
  * actual booleans
* Providers and modules for almost everything
  * Including Fastly!

---

## So no winners neither losers...

<img src=https://media.giphy.com/media/XwfrJN8Xe1W0w/giphy-downsized.gif style="width:30%;">

{{% /section %}}
