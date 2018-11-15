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
![](pexels-photo-358042.jpeg)
</div>
<div id="right">
* Open minded: 
> Experiment. Its about to play. Sometimes you win. Sometimes you learn

* Autonomous
We have our own providers accounts. Directly in touch with sites/clients
</div>

## Benefiting from other Sch services

Reusability of other colleagues code/components.
 
Big department portfolio:
<div id="left">
![](devConsole.jpg)
</div>
<div id="right">
</div>
* AWS bootstrap
* Vulnerability scans
* TravisCI, Artifactory, Spinnaker

## Collaboration + transparency mindset

Internal RFCs
Consumers as contributors
Internal opensource model (full visibility of Github repos)

#

## Product

![](pexels-photo-209722.jpeg){ width=40% }

## Actual need

Project was initiated as several sites realized they had a common problem

## Limited scope

* API as the point of interaction
* No business logic. "Dumb" service
* Almost no-functionality that is used by a single site or no-one

#

## Tech

![](basketball-professional-action-player-163423.jpeg){ width=40% }

##

![](apiV1Arch.png)


## Everything as code 

No space for "one time" actions.

* Alerting configuration by code
* Infrastructure  
* (most of the) Configuration

## Good design/tech choices

(but not perfect / or the best, for sure)

* Immutable pattern
* AWS + Netflix stack + Microservices
* libvips
* Non-blocking services

## Continuous Delivery

And capacity to incorporate everything to the pipeline. 

Small deltas. Iterative deliveries. Low risk deployments.

> Look forward, rather than investing lots of time in your rollback strategy


## 
TODO: pipeline image

## 0-error target

*Yeah, Google SRE book and error budgets...*

... but helped us to understand, tune, and get the trust from Sch sites, avoiding major disruptions
when big sites onboarded, and minimizing the chance of "unplanned / reactive" activities

##

We also rely in a "good enough" test suite (unit+integration+acceptance) 
with a good coverage of all API-functionality

* New error conditions means new tests
* If tests are green, almost (TM) no space for surprises

## Obs+Troubleshooting toolkit

<div id="left">
* When shit happens, at least, let's minimize pain
* Enables experimentation culture
</div>
<div id="right">
![](https://media.giphy.com/media/l0OWiMGpoC6apZFXG/giphy.gif)
</div>

##
![](hystrixDashboardTurbine_quick.gif){ width=80% }


