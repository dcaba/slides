#

## Platform (development) properties

## IaC

* Most of the services in AWS...
* Generating Cloudformations from [python troposphere](https://github.com/cloudtools/troposphere)
* Managing Cloudformation deployments with [Sceptre](https://github.com/cloudreach/sceptre) 
* New projects with infrastructure definition in the same repo than the service code
    * Trying to extend CD to Infrastructure
* We have assessed [AWS GoFormation](https://github.com/awslabs/goformation)
    * But still lacks some functionality, like GetAtt or Ref 

## Code reviews

* Raffle:

```yaml
reviewersRaffle:
  strategies:
    - team-with-knowledge-candidates:
        size: 1
        type: knowledge
        participants:
          teams:
            - spt-infrastructure/edge-team
    - team-random-candidates:
        type: sequential
        size: 2
        participants:
          teams:
            - spt-infrastructure/edge-team
  dailyReminder: enabled
slack:
  - "#spt-edge-prs"
```

##

![](revRaffle.png)

## Other bots

![](otherBots.png){ width=50% }

## Continuous integration and delivery

* travis
* fpm
* hardened images
* spinnaker

## Acceptance & Stress testing

##
![](vegetaAggressive.png)

## Configuration management

| Archaius | Viper |

Local fork given lack of defaults support

## Logs 

## Monitoring and alerting

And escalations using pagerduty

## Real time monitoring

## Distributed tracing

## S2S resiliency

## Secrets management

## Vulnerability scans
