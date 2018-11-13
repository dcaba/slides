#

## Nice solution... but

![](precious.gif)


## Why not docker/k8s?

* Local tests
* YAMS Portal/Frontend already there
* Migration exercise

## gRPC?

## Why not a Service Mesh?

## And Prometheus?

We may. 

And it may be a good moment to consider [opencensus](https://github.com/census-instrumentation/opencensus-go).

#

## Actual (& not so far) future

## More elasticity to reduce costs

* Changes in transformation rules means *massive eviction* 
    * So we are a bit *overscaled*... 
* *Better degradation* and more *efficient ASG triggers*
    * Reusing cache if no capacity
    * Automatic ASG parameters adjustments
    * Minimize parallelization in the transformation pipe 
    * Incoming queue 

## Extra compression

* Currently *libjpg-turbo*
* Good for performance, pretty decent results, but... 
* [MozJPEG](https://github.com/mozilla/mozjpeg), api-compatible with libjpg
* [guetzli](https://github.com/google/guetzli), from Google

## Bringing the service closer to the business

* Image uploader
* Online image editor
* Integration with data services
    * Automatic classification
    * Nudity detector
    * Car plate pixelation
* More regions/cloud providers deployments

##

* Video transcoding...

![](notlisten.gif)

## Actual transformation pipelines
![](fixed-pipeline.svg){ style="border:0" }

## More adoption?

Some major Marketplaces are not using the service, yet

![](dontlike.gif)

## Simulating dependencies failures

[Hoverfly](https://github.com/SpectoLabs/hoverfly): similar in concept to the Simian Army from Netflix, 
but specialized in API degradations

## Stress test as part of the pipeline
