+++
+++

{{% section %}}

{{< slide template="subtitle" >}}

## Infra, cloud and applications

---

*Cloud is about others managing your infra, right? Why should we care?*

---

*And Kubernetes abstracts you from Infra, right?*

<img src=https://docs.google.com/drawings/u/0/d/1_AWWfJ98-Ls_xydeajdQk64ayXkH5tWswT2aYOHxzFA/export/svg?id=1_AWWfJ98-Ls_xydeajdQk64ayXkH5tWswT2aYOHxzFA&pageid=p style="width:40%;">

---

## Positioning infra vs applications

```
                                                    +-----------+ +------------+
                                                    |Configured | |Provisioned |
  +-----+  +----------+   +-------+    +---------+  |  Queue    | |   Bucket   |
  |My   |  |My        |   |       |    |         |  +-----------+ +------------+
  |DNS  |  |configured|   |  APP  |    |   APP   |        +------------+        
  |zones|  |LB        |   |       |    |         |        |    SQL     |        
  +-----+  +----------+   +-------+    +---------+        |  Instance  |        
                                                          +------------+        
+---------+ +---------+ +-----------+ +-----------+ +--------------------------+
|         | |         | |           | |           | |        ||       ||       |
|         | |         | |    K8s    | |           | |        ||       ||       |
|         | |         | |  clusters | |  My VMs   | |Managed ||Managed||       |
| Managed | | Managed | |           | | clusters  | |Queues  ||  DBs  ||Object |
|   DNS   | |   LBs   | +-----------+ |           | |  and   || (SQL  ||Storage|
|         | |         | |  Managed  | +-----------+ |Streams || noSQL)||       |
|         | |         | |    K8s    | |    VM     | |        ||       ||       |
|         | |         | |    API    | | templates | |        ||       ||       |
+---------+ +---------+ +-----------+ +-----------+ +--------------------------+
+---------------------+ +-------------------------+ +--------------------------+
|                     | |                         | |                          |
|   Network offering  | |    Compute offering     | |     Storage offering     |
|                     | |                         | |                          |
+---------------------+ +-------------------------+ +--------------------------+
+------------------------------------------------------------------------------+
|                                                                              |
|                    Your cloud (infrastructure) provider                      |
|                                                                              |
+------------------------------------------------------------------------------+
```

---

## So...

{{% fragment %}} **Your app is not very useful in isolation...** {{% /fragment %}}

{{% fragment %}} **So your app depends on a specific infra configuration...** {{% /fragment %}}
{{% fragment %}} *including kubernetes* {{% /fragment %}}

{{% fragment %}} **And you probably want to use IaC** {{% /fragment %}}

---

![](https://media.giphy.com/media/aZ3LDBs1ExsE8/giphy.gif)

*Fuck, Infra is everywhere*

{{% /section %}}
