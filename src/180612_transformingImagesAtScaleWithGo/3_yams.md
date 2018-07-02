#

##
![](yamsLogo.png){ style="border:0; width:30.0%" }

##
![](portal_screenshot.png){ width=70% }

## 
![](yams_image_test.jpeg)
```json
{
    "format": "jpg",
    "watermark": {
        "location": "north",
        "margin": "20px",
        "dimension": "20%"
    },
    "actions": [
        {
            "resize": {
                "width": 300,
                "fit": {
                    "type": "clip"
                }
            }
        }
    ],
    "quality": 90
}
```

#

## The journey

## 2+1/2 YEARS AGO
![](apiV0Arch.png)

##
![](oldRequestCount.png)

## Firsts onboardings
![](onboardingsArriving.png)

## Onboarding pipelines
![](oldOnboardingPipeline.png)

## Firsts nightmares
![](incidentReport.jpg){ width=80% }

##
![](firstsSpikes.png)

##
![](fastlyIncident.png)

## First (quite manual) release process
![](oldReleaseProcess.png)

## New Architecture
![](apiV1Arch.png)

## New Core
![](openCvToVips.png)

## Self service capabilities
![](selfservice.png){ width=60% }

## Updated onboarding pipelines
![](updatedAdoption.png)

## Current usage
![](currentStats.png)

# 

## (Your?) thoughts so far...

## Why maintaining your own service? 

##
![](pricing.png)

##
![](availability.png)

## 
<div id="left">
![](yamssurvey.png)
</div>
<div id="right">
![](yamsstakeholdersreq.jpg){ width=85% }
</div>

##
![](yapolatency.png)

## But there's already opensource http servers for that, right?

##

* [Imbo](https://github.com/imbo/imbo)
* [imaginary](https://github.com/h2non/imaginary)
* [picfit](https://github.com/thoas/picfit)

## Why not offline transformations?

##
![](yamscontentsreport.png){ width=80% }

## Why microservices?

## +
* *Quicker releases*
* APIGW helps to delegate common functionality
    * But *business agnostic ones*
* *Reusability* of individual microservices
* Each microservice can choose *different techs* 
    * We will focus in delivery-images, in Golang
* Easier to scale with the organization/development team
    * Not taking advantage
* More granular scalability
* and... *fun*

## -
* S2S *communication overhead*
* It can imply extra *costs*
* More *tooling* required (logging, tracing...)
* Reproduce the complete environment becomes tricky
* Always caring about coupled services...
    
##     
    
![](sleepDomainDrivenDesign.jpeg)

## Why not CDN/edge transformations?

##

* Some functionality may be covered...
    * Typically resizing and format conversion
    * But *not all our functionality* (watermarking?)
* It may mean duplicated processing
* Not easy to pack something like libvips as lambdas
* *No unique & global CDN* in Schibsted

## Not a new story... why not presenting it before?

![](imageservice_2.jpg)

##

![](fireman.jpg)

## Why transformations in golang?

## Transformation library
* imageflow was not production ready two years ago, with clear gaps on functionalities and bindings

![](libvipsBench.png){ width=60% }

##
![](myring.gif){ style="border:0" }

## Choosing the programming language 
![](deliveryImagesLang.jpg)

