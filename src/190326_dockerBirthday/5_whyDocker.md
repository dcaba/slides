#

## Why docker?

## Easy way to consume cgroups/namespaces

LXC, from [codekoala/docker-plex](https://github.com/codekoala/docker-plex/blob/master/lxc.config.example)

```bash
lxc.network.type = veth
lxc.network.flags = up
lxc.network.link = br0
lxc.network.name = eth0
lxc.network.hwaddr = 00:11:22:33:44:55

lxc.rootfs = /var/lib/lxc/[NAME]/rootfs
lxc.utsname = [NAME]
lxc.arch = x86_64
lxc.include = /usr/share/lxc/config/archlinux.common.conf

## systemd within the lxc
lxc.autodev = 1
lxc.pts = 1024
lxc.kmsg = 0

## mounts
lxc.mount.entry = /mnt/video /var/lib/lxc/[NAME]/rootfs/video none bind,create=dir 0 0
```

## 

Docker (thanks to [jaymoulin/docker-plex](https://github.com/jaymoulin/docker-plex)):

```bash
$ docker run -d --restart=always --name plex --net=host -v /var/lib/plexmediaserver/:/media \
    -v /media/usbDisk/FamilyData/KidsPelis:/root/Library/KidsPelis \
    ...
    -v /media/usbDisk/FamilyData/Series:/root/Library/Series \
    jaymoulin/plex
```

## And we get a systemd replacement for free

Given dockerd starting at boot time, containers persistence is guaranteed

![](https://media.giphy.com/media/Qg3M2gZq31vF3T9tbe/giphy.gif)

## It works in RPI!

![](https://miro.medium.com/max/1228/1*6MtVE9HXB8yDglp8i4ZfBQ.png)

Actually docker && ARMs is an interesting marriage for IoT
