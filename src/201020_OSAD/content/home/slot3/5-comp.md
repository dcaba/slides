+++
+++

{{% section %}}

{{< slide template="subtitle" >}}

## Config vs Code

---

How IaC looks like with...

{{% fragment %}}**Terraform vs Pulumi** {{% /fragment %}}

{{% fragment %}}![](https://media.giphy.com/media/u4th4weIsJfuE/200w_d.gif){{% /fragment %}}

---

{{< slide class="code-side-by-side" >}}

### Bucket creation example

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

### TF & provider specific config...

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

### Pulumi: Code can use helpers!

```go
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

### TF: Control statements

```hcl
resource "aws_autoscaling_group" "example" {
  launch_configuration = aws_launch_configuration.example.id
  availability_zones   = data.aws_availability_zones.all.names

  min_size = 2
  max_size = 2

  # Use for_each to loop over var.custom_tags
  dynamic "tag" {
    for_each = var.custom_tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}

resource "aws_launch_configuration" "example" {
  image_id        = "ami-07ebfd5b3428b6f4d"
  instance_type   = "t2.nano"

  lifecycle {
    create_before_destroy = true
  }
}
```

---

### While, with Pulumi...


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

### Encapsulation using Pulumi

```python
class RedirectLB:
    def __init__(self, dest_host, dest_path, resource_prefix="redirectLb"):
        self.resource_prefix = resource_prefix
        self.dest_host = dest_host
        self.dest_path = dest_path

    def provision(self):
        self.ip_address = compute.GlobalAddress(
            resource_name="{}-ip".format(self.resource_prefix)
        )
        url_map = compute.URLMap(
            resource_name=self.resource_prefix,
            default_url_redirect=compute.URLMapDefaultUrlRedirectArgs(
                host_redirect=self.dest_host,
                https_redirect=True,
                path_redirect=self.dest_path,
                redirect_response_code="MOVED_PERMANENTLY_DEFAULT",
                strip_query=True,
            ),
        )
        http_target = compute.TargetHttpProxy(
            resource_name="{}-http".format(self.resource_prefix), url_map=url_map
        )
        compute.GlobalForwardingRule(
            resource_name="{}-http".format(self.resource_prefix),
            target=http_target.self_link,
            port_range="80-80",
            ip_address=self.ip_address.address,
        )

    def outputs(self):
        pulumi.export("LB IP address", self.ip_address.address)
```

---

### And, fresh news!

pulumi [automation-api](https://www.pulumi.com/blog/automation-api/) lets you push stack changes also from code:

```go
func NewAddCmd() *cobra.Command {
    return &cobra.Command{
        Use:   "add",
        Short: "add deploys an additional vm stack",
        Run: func(cmd *cobra.Command, args []string) {
                stackName := fmt.Sprintf("vmgr%d", rangeIn(10000000, 99999999))
                s, err := auto.NewStackInlineSource(ctx, stackName, projectName, nil /* Program */)
                fmt.Println("ensuring network is configured...")
                subnetID, rgName, err := EnsureNetwork(ctx, projectName)
                stack.SetProgram(GetDeployVMFunc(subnetID, rgName))
                fmt.Println("deploying vm...")
                stdoutStreamer := optup.ProgressStreams(os.Stdout)

                res, err := s.Up(ctx, stdoutStreamer)
                if err != nil {
                    fmt.Printf("Failed to deploy vm stack: %v\n", err)
                    os.Exit(1)
                }
                fmt.Printf("deployed server running at public IP %s\n", res.Outputs["ip"].Value)
            },
        }
    }
}
```

---

### Some advantages of using Code!

* Abstraction, re-usability and extensibility via standard programming languages capabilities
  * *Inheritance-mixins, interfaces, closures...*
  * *Modules, packages, dep management...*
* Testing
  * [*Pulumi testing guide*](https://www.pulumi.com/docs/guides/testing/)
* Capacity to create complex workflows, including config pre-checks
* Applying clean code practices
* Easier to engage developers?

---

So...

---

> why reinventing software-mgmt patterns on top of configuration languages?

{{% /section %}}
