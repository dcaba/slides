#

## And the problem

![](http://cdn.junglecreations.com/wp/viralthread/2017/05/hungover-spiderman-with-great-power-comes-great-responsibility-and-headaches-e1495636295826.jpg)

## 

> *With remote access enabled, you need to trust the software and Plex Inc...*

## Isolating everything (tm)

* While changing default umask and dir permissions should prevent unauthorized accesses from PMS to other filesystem files if the worst happens...
  
* You may want to isolate your media service software still more
  * I store personal data living in the same home server
  * Quite easy to end up with files in your filesystem with o+r

## Isolating processes in Linux

* Chroot
* Vserver
* SELinux
* VPS / Linux VServer
* VMs
* namespaces
* LXC 
* docker -> libcontainer
