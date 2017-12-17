#

## Q&As

## I'd have done the same just with scripting or a fancy tool
Maybe. But goroutines do work very well in this scenario. 

* *You probably don't want to fork a process per connection you 
want to test*

##
* `hping` does not work as...
    * ...it does not complete the three-way handshake

![](threewayhandshake.jpg){ width=60% }

## Where does the project name come from?
```
Goon: /ɡuːn/ noun informal; noun: goon; plural noun: goons ; 
...
2.
NORTH AMERICAN
a bully or thug, especially a member of an armed or security force.
...
``` 

##
![](thegoon.jpg){ width=40% }

##
*Please, do not read it as "TCP-Go-On". Its awful. Very.*

## This is a very dangerous tool
Probably. Knifes are also dangerous. And you can buy knifes. We cannot prevent bad usage.

![](santaknife.jpg){ width=70% }

## How many connections can you open from a single client?
Depends on how many connections do you support in your client machine :) . 
No official benchmark/stress test yet, but able to open between 5k-10k without problems from my laptop.

## Can I use the tool now?
Yes. And a public docker image is available to facilitate the job:
```bash
% WHALEBREW_INSTALL_PATH=$HOME/bin whalebrew install dachad/tcpgoon
🐳  Installed dachad/tcpgoon to /home/caba/bin/tcpgoon
% tcpgoon myhttpsamplehost.com 80 -c 2 -y 
Total: 2, Dialing: 0, Established: 0, Closed: 0, Error: 0, NotInitiated: 2
Total: 2, Dialing: 0, Established: 2, Closed: 0, Error: 0, NotInitiated: 0
--- myhttpsamplehost.com:80 tcp test statistics ---
Total: 2, Dialing: 0, Established: 2, Closed: 0, Error: 0, NotInitiated: 0
Response time stats for 2 established connections min/avg/max/dev = 57.606ms/63.499ms/69.391ms/5.892ms
% echo $?
0
``` 

## Is this now part of YAMS' acceptance tests?
Not yet. Stress test ELBs is not the objective, so Service Discovery integration is required (& ongoing).

#

## Closure...

## The gifts
![](santaKillerFire.png){ width=50% }

* When assessing post mortems, do not stop until the very last root cause is clear
* One time solutions suck
* Golang works well for building low level utilities
* Code requires continuous testing. Deliverables too

## Special thanks to...

* chadell, also owning the project
* my wife, who created our gopher
* other teams in Schibsted, 
    * creating excellent tools to maintain/run our applications
    * providing also great and valuable feedback

## Further questions?

## Enjoy Christmas!

![](santadrunk.gif)
