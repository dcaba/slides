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

## How can I use it?

* fork()TM
* create a folder under src/ for your slides
* create one or multiple markdown file with the contents (ending by .md)
	* If there's multiple in an specific directory, they will be merged (alphabetical order - you may want to use
	numbers as prefixes) to generate the output
* execute build in the bin folder (you probably want the `build-docker.sh`, so you don't want to deal with requirements)
	* You can pass as a parameter the folder to process
	* If no parameter is provided, will iterate over all subdirs

## How does it work?

* uses pandoc to convert from markup to html5 slides
* reveal.js is used and included in the repo
* but the default reveal template in pandoc is too simple...
	* [https://gist.github.com/aaronwolen/5017084] included and improved with the comments
	* custom css template generated to customize font size, text alignment...
