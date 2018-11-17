#

## Nice solution... but

![](block.gif)

## Why not docker/k8s?

* Local tests
* YAMS Portal/Frontend already there
* Migration exercise

## Why not a Service Mesh?

## How to prevent unplanned still more?

![](pexels-photo-1539678.jpeg){ width=80% }

##

* Canary analysis
    * See [Spinnaker implementation](https://www.spinnaker.io/guides/user/canary/judge/)
* Stress tests in the acceptance tests
    * Specific tcp stress tool released, [tcpgoon](https://github.com/dachad/tcpgoon)
* Simulate dependencies degradation
    * similar in concept to the Simian Army from Netflix, but specialized in API, 
    [Hoverfly](https://github.com/SpectoLabs/hoverfly): 


## Are you going to opensource it?

* Schibsted contributes to opensource projects
* And also releases
    * See [Schibsted Github organization](https://github.com/schibsted)
* Problem: Not following a "contribute-first" approach
* But already contributed to bimg, zuul, krakenD...
 
## Are you going to offer this SaaS to other companies?

![](competence.gif)
