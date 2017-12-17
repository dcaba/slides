# 

## Is this everything?

No...

![](cat-jumping.gif)

## Supporting a relatively high number of connections in parallel...

...is an easy job...

![](easyJob.gif)

##
... but fragile.

![](slip_on_ice_breakdance_moves.gif)

## Back to the basics

![](TCP+backlog+queues.jpg){ width=90% }

## Points to bear in mind

* **OS** (net.core.somaxconn, ethernet cards queues, devices backlogs...)
* **max file descriptor limits** *for the user running the service*
* in a multiprocess model (legacy?), max processes limits *for the user running the service*
* **Connector/listener** in your application / application server 
* **Associated thread pools** / incoming requests **queue** (if applies)
* Probably you also want pooling-multiplexing against backends
* Don't forget about other processes using resources
* And is there a **load balancer in front of you?** More considerations may apply

## 

> **If you break a single item, you hit the ground** 

![](hit-ground.gif)

Plus it may not manifest soon; you realize when:

* Lots of ELBs in front of you (normally under high load) pre-opening hundreds of connections
* Or issues with backend components (slow responses?) so in-flight connections increase drastically

## Ook, but you are careful, you review PRs, and you do stress tests...

... *you are safe*. Really?

![](againquestion.jpg)

## New incident
![](againConfirmed.jpg)

## Incident 2017-10-31
![](incident1710.jpg)

## AND Incident 2017-11-24
![](Incident1711.jpg)

## WTF
![](santafiringmeme.jpg)
