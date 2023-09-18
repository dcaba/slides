# slides
Basic pandoc wrapper to generate slides using markdown, as well as slides the author has been generating in the src dir.

## Slides generated so far

* [tcpgoon](https://github.com/dachad/tcpgoon) presentation at [SDN and Network Programmability Meetup in Barcelona](https://www.meetup.com/es-ES/SDN-and-Network-Programmability-Meetup-in-Barcelona/events/245132925/):
[HIGH VOLUME WEB SERVICES, MAXCONNECTIONS AND TCPGOON](http://dcaba.github.io/slides/171218_tcpgoonAtBcnNetworkMeetup/)
* [Yet Another Image Transformation Service At High Scale Using Golang](https://dcaba.github.io/slides/180612_transformingImagesAtScaleWithGo/)
at [Barcelona Golang Meetup](https://www.meetup.com/es-ES/Golang-Barcelona/events/252114527/)
* [Schibsted YAMS or how to build and maintain a thousands req/s service with minimal dedication](https://dcaba.github.io/slides/181119_yamsServiceAndOps)
at [DevOpsDays Warsaw](https://devopsdays.pl/)
* [CHROOTED MEDIA SERVER MADE EASY](https://dcaba.github.io/slides/190326_dockerBirthday) for
[Docker Bday #6](https://events.docker.com/events/details/docker-barcelona-presents-docker-bday-6-how-do-you-docker/)
* [INFRASTRUCTURE AS CODE OR INFRASTRUCTURE AS CONFIGURATION?](https://dcaba.github.io/slides/190605_doxelona_IaC) at [Devops Exchange Barcelona meetup](https://www.meetup.com/es-ES/devops-exchange-barcelona/events/261831097)
* [INFRASTRUCTURE AS CODE OR INFRASTRUCTURE AS CONFIGURATION?](https://dcaba.github.io/slides/190620_devopsExchange_IaC) at [Devops Exchange London](https://www.youtube.com/watch?v=Yp9YdscJ2eg)
* [Cloud Providers and the IaC hell](https://dcaba.github.io/slides/200428_KTH_IaC/) at [KTH Royal Institute of Technology in Stockholm](https://github.com/KTH/devops-course)
* [Configuration templating vs configuration as code, 12th round](https://dcaba.github.io/slides/201020_OSAD/) ([video](https://www.youtube.com/watch?v=qOg6iI13JV8)) at [OSAD 2020](https://osad-munich.org/en/)
* [Observing Fastly’s Network at Scale Thanks to K8s and the Strimzi Operator](https://static.sched.com/hosted_files/kccnceu2022/06/Observing%20Fastly%E2%80%99s%20network%20at%20scale%20thanks%20to%20K8s%20and%20the%20Strimzi%20operator.pdf) ([video](https://www.youtube.com/watch?v=eYZO7n_o0OQ)) at [Kubecon EU 2022](https://sched.co/ytrM)
* [Routing-state observation + modification in AWS/ECS with pulumi-managed API](https://osad-munich.org/wp-content/uploads/2022/10/15.00-Rodriguez.pdf) ([video](https://www.youtube.com/watch?v=P-0v1haFktc)) at OSAD 2022

## How can I use it?

*This information is quite outdated: 2019/2020 presentations are being rendered by hugo*

* fork()TM
* create a folder under src/ for your slides
* create one or multiple markdown file with the contents (ending by .md)
	* If there's multiple in an specific directory, they will be merged (alphabetical order - you may want to use
	numbers as prefixes) to generate the output
* execute build in the bin folder (you probably want the `build-docker.sh`, so you don't want to deal with requirements)
	* You can pass as a parameter the folder to process
	* If no parameter is provided, will iterate over all subdirs

## How does it work?

*This information is quite outdated: 2019/2020 presentations are being rendered by hugo*

* uses pandoc to convert from markup to html5 slides
* reveal.js is used and included in the repo
* but the default reveal template in pandoc is too simple...
	* [https://gist.github.com/aaronwolen/5017084] included and improved with the comments
	* custom css template generated to customize font size, text alignment...
