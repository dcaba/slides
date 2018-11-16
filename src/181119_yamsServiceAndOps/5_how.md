#

## How did you achieved that?

![](magic.gif)


## Combination of...

![](https://docs.google.com/drawings/u/0/d/1qf2IIJ3VDIRXp2m_cFuOw6wUXl3o-ZJSToRcpdVBjz4/export/svg?id=1qf2IIJ3VDIRXp2m_cFuOw6wUXl3o-ZJSToRcpdVBjz4&pageid=p){ style="border:0; box-shadow:none" }

## Don't you see some similarity?

![](https://docs.google.com/drawings/u/0/d/1Q1pXKPKSngwxlpDLV6szW01RQDPdqE2VvKkbWo6Qxw0/export/svg?id=1Q1pXKPKSngwxlpDLV6szW01RQDPdqE2VvKkbWo6Qxw0&pageid=p){ style="border:0; box-shadow:none; width:70.0%" }

#

## Team

![](team-girls-basketball-team-girls-basketball-159812.jpeg){ width=70% }

## Agile

<div id="left">
![](pexels-photo-358042.jpeg){ width=70% }
</div>
<div id="right">
* *Continuous improvement*
    * Experiment. Its about to play. Prompt feedback. **Sometimes you win. Sometimes you learn**
* *Autonomous*
    * **Transversal team**. We have our own providers accounts. Directly in touch with sites/clients
</div>

## Benefiting from other Sch services

Reusability of other colleagues code/components

![](devConsole.jpg){ width=50% }


## Collaboration and transparency

<div id="left">
<br>
<br>


* Internal RFCs
* Consumers as contributors
* Internal opensource model 
</div>
<div id="right">
![](pexels-photo-428318.jpeg)
</div>

#

## Product

![](pexels-photo-209722.jpeg){ width=40% }

## There is an actual need

Project was initiated by and for several sites that had a common problem

![](pexels-photo-1040482.jpeg){ width=70% }

## Limited scope

* API as the point of interaction
* No business logic. "Dumb" service
* Almost no-functionality that is used by a single site, or not used at all

## As-a-service experience

* Self-service
* Multitenant API
* Metrics reporting per tenant

#

## Tech

![](basketball-professional-action-player-163423.jpeg){ width=40% }


## Good design/tech choices

![](pexels-photo-917503.jpeg)

##
<div id="left">
![](apiV1Arch.png)
</div>
<div id="right">
* Immutable pattern
* Microservices
* AWS + Netflix stack
* libvips
* Non-blocking services
</div>

##
> *But not perfect neither the best, for sure*

## Everything as code 

No space for "one time" actions.

* Alerting configuration by code
* Infrastructure  
* (Most of the) application configuration

## Continuous Delivery

And capacity to incorporate everything to the pipeline. 

Small deltas. Iterative deliveries. Low risk deployments. And be smart assuming risks

## 
![](https://docs.google.com/drawings/u/0/d/1ow8G2sYAyLT74FK1W-gsXRtqBkg5Ibsa0LbFTSrJUGM/export/svg?id=1ow8G2sYAyLT74FK1W-gsXRtqBkg5Ibsa0LbFTSrJUGM&pageid=p){ style="border:0; box-shadow:none" }

##
> *Look forward, rather than investing lots of time in your rollback strategy*

## 0-error target
![](nbastats.jpg){ width=70% }

##
![](71TheKvgqML.jpg){ width=40% }

Yeah, Google also states something different by introducing error budgets...

##
... but helped us:
 
* to *understand & tune* the platform,
* get *trust* from Sch sites, avoiding major disruptions when big sites onboarded, 
* and *minimizing unplanned* / reactive activities

## Observability toolkit
<div id="left">
* Shit happens
    * *let's minimize pain*
* Unlocks *experimentation culture*
    * As understanding what happens becomes easier 
</div>
<div id="right">
![](failure.gif)
</div>

##
![](hystrixDashboardTurbine_quick.gif){ width=80% }

## 
If we connect this to immutability...

![](pexels-photo-1293265.jpeg){ width=60% }

> *Incident troubleshooting can become a forensics exercise*
