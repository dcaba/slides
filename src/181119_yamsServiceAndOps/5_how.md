#

## How did you achieved that?

<!-- TODO: magic potion image -->

## Combination of...

* Team
* Product 
* Tech

## Don't you see the similarity?

<!-- diagram: team, individual capacity, coach -->

#

## Team

## Autonomy

## Benefiting from other Sch services

Reusability of other colleagues code/components.
 
Big department portfolio:

* AWS bootstrap
* Vulnerability scans
* TravisCI, Artifactory

## Collaboration + transparency mindset

Internal RFCs
Consumers as contributors
Internal opensource model (full visibility of Github repos)

#

## Product

## Actual need

## Limited scope

API as the point of interaction
No business logic. "Dumb" service
Almost no-functionality that is used by a single site or no-one

#

## Tech

<!-- TODO: platform image -->


## Everything as code 

No space for "one time" actions.

* Alerting configuration by code
* Infrastructure updates 

## Good design choices

(but not perfect / or the best, for sure)

* Immutable pattern
* AWS + Netflix stack + Microservices
* libvips

## Continuous Delivery

And capacity to incorporate everything to the pipeline. 
> Looking forward, rather than investing lots of time in your rollback strategy

Small deltas. Iterative deliveries. Low risk deployments.

## 
<!-- TODO: pipeline image -->

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

Enables experimentation culture





