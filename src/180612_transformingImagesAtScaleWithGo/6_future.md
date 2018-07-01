#

## Nice solution... but

## Why not terraform?

## Why not docker/k8s?

* Local tests
* YAMS Portal/Frontend already there
* Migration exercise

## And PaaS?

## gRPC?

## Why not a Service Mesh?

## Why not Google Cloud?

## And Cassandra?

## And Prometheus?

We may. 

And it may be a good moment to consider [opencensus](https://github.com/census-instrumentation/opencensus-go)

#

## Actual future

## Multiregion

* Buckets are already replicated in two regions per continent
* v0 was running in Oregon and Ireland
* v1 still in Virginia, and now also in us-east-1
    * We may also deploy in Paris of Frankfurt
* Still open discussions in regards to DynamoDB usage

## Smoke tests

* We had some satellites in v0 calling the API constantly

## More elasticity to reduce costs

* Changes in transformation rules means massive eviction 
    * So a bit overscaled... 
* Incoming queue and reusing cache if no capacity
* Better degradation but efficient ASG triggers

## Extra compression

* Currently libjpg-turbo
* Good for performance, pretty decent results... 
* [MozJPEG](https://github.com/mozilla/mozjpeg), api-compatible with libjpg
* [guetzli](https://github.com/google/guetzli), from Google

## Bringing the service closer to the business

* Image uploader
* Online image editor
* Integration with data services
    * Automatic classification
    * Nudity detector
    * Car plate pixelation

## More engines

* PDF conv makes sense for attachments (CVs). 
    * Benchmark already done

* Video...

## Actual transformation pipelines
Include current workflow

## More adoption?

Still some major Marketplaces are not using the service

## ApiGW replacement?

Zuul could be replaced by Krakend

## Simulating dependencies failures

Similar in concept than the Simian Army from Netflix...

[https://github.com/SpectoLabs/hoverfly](Hoverfly)
