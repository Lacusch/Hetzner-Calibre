# How to setup a calibre content server on Rocky Linux 9 (hard way)

- [ ] Setup the most basic working prototy for Calibre (That works)
- [ ] Iterate on it until it works well enough for me
- [ ] Document the setup and steps

# Try to setup podman

dnf istall podman
# Set compose prodiver to podman 
export "PODMAN_COMPOSE_PROVIDER=podman"
podman driver doesn't work well/easily, tricky to install. Try to use sytemd service instead
https://github.com/containers/podman-compose#installation

podman generate systemd can create service files DEPRECATED command:
It is recommended to use Quadlets for running containers and pods under systemd.

Having fun already ...
it seems to work still though today (2025-05-09)

Podman Quadlet look cool but linux server.io image has a remove desktop now calibre content server

https://docs.podman.io/en/latest/markdown/podman-systemd.unit.5.html
use either s3 fuse or some sort of network storadge for some / most files
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin
2025-05-09 21:40:29 URL:https://download.calibre-ebook.com/linux-installer.sh [35050/35050] -> "-" [1]
Using python executable: /bin/python3
Your system has GNU libc version 2.34. The calibre binaries require at least version: 2.35 (released on 2022-02-03). Update your system.

Calibre refuses to install on Rocky Linux 9

Podman systemd service

Copy libary over

'scp -r /home/lacusch/Calibre-libary root@test-server-0:/root/Calibre-Libar'

Dockerfile

'''dockerfile
FROM ubuntu:24.04 AS build
RUN apt-get update && apt-get install -y wget python3 libopengl0 libegl1 libxcb-cursor0 freetype* xz-utils fontconfig libxkbcommon0 && rm -rf /var/lib/apt/lists/*
RUN wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin
'''
podman run -v /root/Calibre-Libary:/etc/calibre/library:Z -it 060724bd57ef bas

https://www.mobileread.com/forums/showthread.php?t=333503
https://www.mobileread.com/forums/showthread.php?t=347837

podman run -v /root/Calibre-Libary:/etc/calibre/library:Z -p 8080:8080 -it 008b6db89bcd bash

calibre-server library/

# :Z 
# :Z – relabels the directory for private SELinux access (single container)
podman run -v /root/Calibre-Libary:/etc/calibre/library:Z -p 8080:8080 -it 008b6db89bcd /usr/bin/calibre-server /etc/calibre/library
podman run -v /root/Calibre-Libary:/etc/calibre/library:Z -p 8080:8080 -d 008b6db89bcd /usr/bin/calibre-server /etc/calibre/library

Only do a readonly blind mount with the podman container
':ro'

user rsync to sync the files

Get create command out of the container:

podman container inspect c586 | jq .[].Config.CreateCommand
[
  "podman",
  "run",
  "-v",
  "/root/Calibre-Libary:/etc/calibre/library:Z",
  "-p",
  "8080:8080",
  "-d",
  "008b6db89bcd",
  "/usr/bin/calibre-server",
  "/etc/calibre/library"
]
