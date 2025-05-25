FROM ubuntu:24.04 AS build
LABEL org.opencontainers.image=.title"Calibre Server"
LABEL org.opencontainers.image.description="Container image of calibre server"
LABEL org.opencontainers.image.version="0.1"
LABEL org.opencontainers.image.authors="szabo.lacus.2001@gmail.com"
LABEL org.opencontainers.image.source="https://calibre-ebook.com"
LABEL org.opencontainers.image.licenses="GPL-3.0-or-later"
RUN apt-get update && apt-get install -y \
wget \ 
python3 \ 
libopengl0 \
libegl1 \
libxcb-cursor0 \
freetype* \
xz-utils \
fontconfig \
libxkbcommon0 \
libxcb-xinerama0 \
libxcb-icccm4 \
libxcb-image0 \
libxcb-keysyms1 \
libxcb-render-util0 \ 
# https://stackoverflow.com/a/67205123
# freeglut3 \ 
freeglut3-dev \
&& rm -rf /var/lib/apt/lists/*
RUN wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin
CMD ["calibre-server", "/library"]
